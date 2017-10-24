class ImportController < ApplicationController
  require 'open-uri'
  def index
    Vote.all.destroy # To do - optimise?
    data_uri = "http://www.statesassembly.gov.je/Feeds/VotingDataJSON?Year=2014"
    raw_data = open(data_uri).read
    puts "Data retrieved"
    @data = JSON.parse(raw_data)
    puts "Data parsed"
    @data.each do |item|
      vote = Vote.new
      vote.proposition_id = item['Id']
      vote.type = item['Vote']
      vote.save
    end
    puts "Data import complete"
  end
end
