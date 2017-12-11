class ImportTermsController < ApplicationController

require 'open-uri'
def index
	Term.delete_all
	### Online converted csf file to json and saved in /public folder ###
	data_uri = "http://deb.gavo.org:3000/terms.json"
	raw_data = open(data_uri).read
	@data = JSON.parse(raw_data)
	@data.each do |item|
		politician = Politician.find_by(full_name:item['Name'])

		term = Term.new
		pid = 0
		a = 0
		(item['Location'] == "St Helier" ? pid=1 : a)
		(item['Location'] == "Grouville" ? pid=2 : a)
		(item['Location'] == "St Brelade" ? pid=3 : a)
		(item['Location'] == "St Clement" ? pid=4 : a)
		(item['Location'] == "St John"  ? pid=5 : a)
		(item['Location'] == "St Lawrence" ? pid=6 : a)
		(item['Location'] == "St Martin" ? pid=7 : a)
		(item['Location'] == "St Mary" ? pid=8 : a)
		(item['Location'] == "St Ouen" ? pid=9 : a)
		(item['Location'] == "St Peter" ? pid=10 : a)
		(item['Location'] == "St Saviour" ? pid=11 : a)
		(item['Location'] == "Trinity" ? pid=12 : a)
		(item['Location'] == "Island-wide" ? pid=13 : a)

		term.parish_id = pid
		if politician != nil then
			term.politician_id = politician.id
		end if
		term.position = item['Position']
		term.begin_date = item['From']
		term.end_date = item['To']
		term.save
		end
		puts 'Data import complete'
	end
end