require 'pry'
require "#{Rails.root}/lib/shared_helpers/process_csv_helper"
include ProcessCSVHelper
namespace :result do
  desc "Load results from MeetManager files"
  task load: :environment do

    dir = '/Users/jasonhooper/Desktop/DSE Short Course 2014/Results'

    Dir.foreach(dir) do |file|
      next if ['.','..','Processed'].include?(file)
      puts 'Processing... ' + dir + '/' + file

      process_file(dir + '/' + file)
    end
  end

end
