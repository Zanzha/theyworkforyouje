class ImportController < ApplicationController
  require 'open-uri'
  def index
    Vote.delete_all
    array = ['2004','2005','2006','2007','2008','2009','2010','2011','2012','2013','2014','2015','2016','2017']
    array.each do |year|
      data_uri = "http://www.statesassembly.gov.je/Feeds/VotingDataJSON?Year=#{year}"
      raw_data = open(data_uri).read
      @data = JSON.parse(raw_data)
      @data.each do |item|
        vote = Vote.new
        vote.proposition_id = item['Reference']
        vote.voting_id = item['Id']
        vote.voting_date = item['Date']
        vote.proposition_title = item['PropositionTitle']
        vote.vote_type = item['Vote']
        vote.member_name = item['MemberName']
        vote.member_position = item['MemberPosition']
        vote.save
      end
    end
    puts 'Data import complete'
  end
end