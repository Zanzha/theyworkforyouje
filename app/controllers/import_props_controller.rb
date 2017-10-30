class ImportPropsController < ApplicationController
require 'open-uri'

 def index

##### statesassembly may IP ban you for running this script
##### Dont run on IP you want to view the site on in future - ie. DJ
##### Will take >4h to complete
exit

  for page_id in 1..136 do
   page = Nokogiri::HTML(open("http://www.statesassembly.gov.je/Pages/Propositions.aspx?page=#{page_id}&SortBy=pnumber&items=50&query=&sadocumentdatefrom=1998-01-01&sadocumentdateto=2020-11-30"))
   puts "\nPage: #{page_id}\n"
   all_props = page.css(".latestdecisions table")
   all_props.each do |item|

    referance   = item.css('td')[0].text.strip
    title       = item.css('.title a').text.strip
    lodged_by   = item.css('td')[4].text.strip
    prop_date   = Date.strptime(item.css('td')[7].text.strip, "%d/%m/%Y").to_s
    more_info   = "http://www.statesassembly.gov.je/Pages/Propositions.aspx" + item.css('.moreinfo a')[0]["href"]
    prop_pdf   = item.css('.title a')[0]["href"]
    debate_date = item.css('td')[10].text.strip

    status="Active"
    if debate_date.include? "Withdrawn"
     debate_date = debate_date.split.to_a.first
     status ="Withdrawn"
    end
    if (!debate_date.blank?)
     debate_date = Date.strptime(debate_date, "%d/%m/%Y").to_s
    end

    ### Load full proposition page to get more info
    more_uri = Nokogiri::HTML(open("#{more_info}"))
    prop_page = more_uri.css(".ministerialdecisions").to_s

    hansard = prop_page.match(/(http:\/\/www.statesassembly.gov.je\/AssemblyHansard\/(.*).pdf)/).to_a
    (!hansard.blank? ? hansard = hansard[1] : hansard = "")

    minutes = prop_page.match(/(http:\/\/www.statesassembly.gov.je\/AssemblyMinutes\/(.*).pdf)/).to_a
    (!minutes.blank? ? minutes = minutes[1] : minutes = "")

    votes = prop_page.scan(/Votes.aspx\?VotingId=([0-9]{1,7})/).to_a
    if (!votes.empty?)
     votes.each do |vote|
     vote = vote.to_s
     vote = vote.gsub(/[^[:alnum:]]/, "")
     proposition = Proposition.new
     proposition.prop_name = title
     proposition.prop_date = prop_date
     proposition.lodged_by = lodged_by
     proposition.debate_date = debate_date
     proposition.prop_pdf = prop_pdf
     proposition.minutes_pdf = minutes
     proposition.hansard_pdf = hansard
     proposition.vote_id = vote
     proposition.status = status
     proposition.p_id = referance
     proposition.save
    end
    else
     proposition = Proposition.new
     proposition.prop_name = title
     proposition.prop_date = prop_date
     proposition.lodged_by = lodged_by
     proposition.debate_date = debate_date
     proposition.prop_pdf = prop_pdf
     proposition.minutes_pdf = minutes
     proposition.hansard_pdf = hansard
     proposition.status = status
     proposition.p_id = referance
     proposition.save
    end
    sleep(1)
   end
  end
 end
end