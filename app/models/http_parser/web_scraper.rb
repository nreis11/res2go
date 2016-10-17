require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'pry'
require 'csv'

# USE REAL URL WHEN READY
# reservoir_page = HTTParty.get("http://cdec.water.ca.gov/cgi-progs/reservoirs?s=RES")

# SCRAPING FROM FILE TEMPORARILY
file = File.open('reservoirs.html', 'r')
reservoir_page = file.read

noko_res = Nokogiri::HTML(reservoir_page)

# File.open('reservoirs.html', 'w') { |file| file.write(noko_res) }

table_data = []
table_data_children = [1, 3, 5]

main_content = noko_res.css('#main_content')

headers_text = main_content.css('tr')[1].text
headers = headers_text.split("\n").map { |header| header }
# Remove newline in first index
headers.delete_at(0)

# reservoir_names = main_content.css('tr').css('td').first.text
# reservoir_name = main_content.css('tr')[4].css('td').first.text

# table_data = table_data_children.map do |child_index|
#   data_point = main_content.css('tr')[4].css("td:nth-child(#{child_index})").text
#   data_point
# end

table_rows = main_content.css('tr')

rows = []
table_rows.each do |row|
  table_data = table_data_children.map do |child_index|
    data_point = row.css("td:nth-child(#{child_index})").text
    data_point.strip
  end
  rows << table_data
end

rows.delete_if { |row| row.any? { |value| value.length < 3 } }
rows.delete_at(0)

# table_rows = table_rows.keep_if { |row| row.count > 10 }
headers = ["name", "capacity", "storage"]

CSV.open("reservoir_data.csv", 'w') do |csv|
  csv << headers
  rows.each do |row|
    csv << row
  end
end






# Pry.start(binding)