class ImportPoliticiansController < ApplicationController
require 'open-uri'

 def index

  Politician.delete_all

  data_uri = "http://www.statesassembly.gov.je/Pages/Members.aspx?showall=1"
  raw_data = open(data_uri).read
  result = raw_data.scan(/\?MemberId=([0-9]{1,5})/).flatten
  result.each do |profile_id|

   page = Nokogiri::HTML(open("http://www.statesassembly.gov.je/Pages/Members.aspx?MemberId=#{profile_id}"))
   profile_data = page.to_s

   ### the only thing that can be counted, can vary from 0
   summary = page.css('p')[0].text.strip!
   email = page.css('a[href*="mailto"]/@href').map(&:text).find { |e| e.include? 'gov.je' }.to_s.sub('mailto:','')
   photo = "http://www.statesassembly.gov.je"+page.css('img#ctl00_PlaceHolderMain_EditModePanelintroview_Members_imgMember/@src').text
   position, fullname = page.css('#ctl00_PlaceHolderMain_EditModePanelintroview_Members_lblTitle').text.strip.split(' - ')
   first_name = fullname.split.first
   last_name = fullname.split.last

   ### data varies per page and no class per item on lovely states site
   address = profile_data.scan(/Address(.*\s+<\/div>\s+<p>\s+)([0-9a-zA-Z<\/>,\'. ]+)/)
   (!address.blank? ? address = address[0][1].strip.sub('\'', '`') : address = "")

   landline = profile_data.scan(/Telephone(.*\s+<\/div>\s+<p>\s+)([0-9 ]+)/)
   (!landline.blank? ? landline = landline[0][1].strip : landline = "")

   mobile = profile_data.scan(/Mobile(.*\s+<\/div>\s+<p>\s+)([0-9 ]+)/)
   (!mobile.blank? ? mobile = mobile[0][1].strip : mobile = "")

   fax = profile_data.scan(/Fax(.*\s+<\/div>\s+<p>\s+)([0-9 ]+)/)
   (!fax.blank? ? fax = fax[0][1].strip : fax = "")

   parish = profile_data.scan(/Parish(.*\s+<\/div>\s+<p>\s+)([a-zA-Z. ]+)/)
   (!parish.blank? ? parish = parish[0][1] : parish = "")

   politician = Politician.new
   politician.full_name = fullname
   politician.first_name = first_name
   politician.last_name = last_name
   politician.title = position
   politician.avatar = photo
   politician.summary = summary
   politician.address = address
   politician.mobile = mobile
   politician.landline = landline
   politician.fax = fax
   politician.parish = parish
   politician.email = email
   politician.save

   sleep 1
   end
  end
 end