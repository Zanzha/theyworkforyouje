class ImportPoliticiansController < ApplicationController
require 'open-uri'

 def index

#  Politician.delete_all

(57..232).each do |member_id|
	puts "\n\n#{member_id}\n\n"
   page = Nokogiri::HTML(open("http://www.statesassembly.gov.je/Pages/Members.aspx?MemberId=#{member_id}"))
   profile_data = page.to_s

   ### the only thing that can be counted, can vary from 0

	(!page.css('p')[0].blank? ? summary = page.css('p')[0].text.strip! : summary = "")
   email = page.css('a[href*="mailto"]/@href').map(&:text).find { |e| e.include? 'gov.je' }.to_s.sub('mailto:','')
   photo = "http://www.statesassembly.gov.je"+page.css('img#ctl00_PlaceHolderMain_EditModePanelintroview_Members_imgMember/@src').text
   position, fullname = page.css('#ctl00_PlaceHolderMain_EditModePanelintroview_Members_lblTitle').text.strip.split(' - ')
	### If deleted/blank member id ###
	if (fullname.blank?)
	next
	end
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
   (!parish.blank? ? parish = parish[0][1] : parish = "Island Wide")

pid = 13
a = 0
(parish == "St. Helier" ? pid=1 : a)
(parish == "Grouville" ? pid=2 : a)
(parish == "St. Brelade" ? pid=3 : a)
(parish == "St. Clement" ? pid=4 : a)
(parish == "St. John"  ? pid=5 : a)
(parish == "St. Lawrence" ? pid=6 : a)
(parish == "St. Martin" ? pid=7 : a)
(parish == "St. Mary" ? pid=8 : a)
(parish == "St. Ouen" ? pid=9 : a)
(parish == "St. Peter" ? pid=10 : a)
(parish == "St. Saviour" ? pid=11 : a)
(parish == "Trinity" ? pid=12 : a)
(parish == "Island-wide" ? pid=13 : a)


politician_exists = Politician.find_by(full_name:fullname)

if (!politician_exists)

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
   politician.parish_id = pid
 #  politician.parish = parish
   politician.email = email
   politician.save

sleep 1
   end
end

  end
 end