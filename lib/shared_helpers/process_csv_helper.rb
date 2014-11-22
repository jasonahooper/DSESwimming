require 'csv'
module ProcessCSVHelper

  def process_file(file_path)

    event_id = nil
    desc = nil
    sex = nil

    found = false
    first = true
    CSV.read(file_path, { :col_sep => "\t" }).each do |line|
      if first
        event_id = line.first.split[1].to_i
        Result.where(:event_id == event_id).destroy_all
        sex = (line.first.split[2] == 'Mens' && 'm') || 'f'
        desc = line.first
        first = false
        puts desc
      elsif !found
        found = (line[8] == 'BDPoints')
      elsif found && line.first != 'Place'
        pos = 0
        pos = line[0].chop.to_i if line[0]
        name = line[1]
        age = line[2].to_i
        age = Time.now.year - line[2][1..2].to_i if line[2] && line[2][0] == '('
        group = (age > 18 && 'S') || (age > 16 && 'Y') || (age > 13 && 'B') || (age > 9 && 'A') || '!'
        region = line[3]
        classification = line[4]
        points = line[8].to_i
        if name
          Result.create! :event_id => event_id, :position => pos, :competitor => name, :sex => sex,
                           :age_group => group, :classification => classification, :region => region,
                           :points => points
        end
      else
        found = false
      end
    end
  end
end
