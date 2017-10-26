class ImportController < ApplicationController
  require 'open-uri'
  def index
    Vote.delete_all
    data_uri = 'http://www.statesassembly.gov.je/Feeds/VotingDataJSON?Year=2014'
    raw_data = open(data_uri).read
    @data = JSON.parse(raw_data)
    @data.each do |item|
      vote = Vote.new
      vote.proposition_id = item['Id']
      vote.type = item['Vote']
      vote.save
    end
    puts 'Data import complete'
  end
end
