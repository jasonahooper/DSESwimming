class CreateResult < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :event_id
      t.integer :position
      t.string :competitor
      t.string :sex
      t.string :age_group
      t.string :classification
      t.string :region
      t.integer :points
      t.timestamps
    end
  end
end
