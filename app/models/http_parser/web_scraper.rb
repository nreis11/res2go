require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'pry'
require 'csv'

reservoir_page = HTTParty.get("http://cdec.water.ca.gov/cgi-progs/reservoirs?s=RES")

noko_res = Nokogiri::HTML(reservoir_page)

# File.open('reservoirs.html', 'w') { |file| file.write(noko_res) }

headers = []
table_data = []

main_content = noko_res.css('#main_content')

headers_text = main_content.css('tr')[1].text
headers = headers_text.split("\n").map { |header| header }
headers.delete_at(0)

Pry.start(binding)