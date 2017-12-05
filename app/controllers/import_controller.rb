class ImportController < ApplicationController
  require 'open-uri'
  def index
#    Vote.delete_all
    array = ['2017','2018']
    array.each do |year|
      data_uri = "http://www.statesassembly.gov.je/Feeds/VotingDataJSON?Year=#{year}"
      raw_data = open(data_uri).read
      @data = JSON.parse(raw_data)
      @data.each do |item|
        politician = Politician.find_by(full_name:item['MemberName'])
        proposition = Proposition.find_by(p_id:item['Reference'])
		vote_reference = Vote.find_by(p_id:item['Reference'])

###  needs altering   if politician_id == something && proposition_id == proposition.id
##		if(!vote_reference)
          vote = Vote.new
          if politician != nil then
            vote.politician_id = politician.id
          end if
          if proposition != nil then
            vote.proposition_id = proposition.id
          end if
        vote.p_id = item['Reference']
        vote.voting_id = item['Id']
        vote.voting_date = item['Date']
        vote.proposition_title = item['PropositionTitle']
        vote.vote_type = item['Vote']
        vote.member_name = item['MemberName']
        vote.member_position = item['MemberPosition']
        vote.save
##		end
      end
    end
  puts 'Data import complete'
  end
end