# USE REAL URL WHEN READY
reservoir_page = HTTParty.get("http://cdec.water.ca.gov/cgi-progs/reservoirs?s=RES")

# SCRAPING FROM FILE TEMPORARILY
# file = File.open('reservoirs.html', 'r')
# reservoir_page = file.read

# Convert to nokogiri doc
noko_doc = Nokogiri::HTML(reservoir_page)

# IF I NEED ALL THE HEADERS
# headers_text = main_content.css('tr')[1].text
# headers = headers_text.split("\n").map { |header| header }

# TABLE DATA CHILDREN TO EXTRACT
def extract_table_data(document)
  table_data_children = [1, 3, 5]
  main_content = document.css('#main_content')
  table_rows = main_content.css('tr')

  rows = []
  table_rows.each do |row|
    table_data = table_data_children.map do |child_index|
      data_point = row.css("td:nth-child(#{child_index})").text
      data_point.strip
    end
    rows << table_data
  end
  rows
end

# Delete whitespace and regions
def clean_up_data(rows)
  rows.delete_if { |row| row.any? { |value| value.length < 3 } }
  # Remove headers and trailing header
  rows.delete_at(0)
  rows.delete_at(-1)
  rows
end

# def create_hashes(rows)
#   headers = ["name", "capacity", "storage"]
#   hashes = rows.map do |row|
#     Hash[headers.zip(row)]
#   end
#   hashes
# end

# Write to file
def csv_writer(rows)
  headers = ["name", "capacity", "storage"]
  CSV.open("reservoir_data.csv", 'w') do |csv|
    csv << headers
    rows.each do |row|
      csv << row
    end
  end
end

# Open csv
def parse_csv(filename)
  reservoir_hashes = []
  CSV.foreach(filename, headers:true, :header_converters => :symbol) do |row|
    row[:capacity] = row[:capacity].delete(',').to_i
    row[:storage] = row[:storage].delete(',').to_i
    reservoir_hashes << row.to_hash
  end
  reservoir_hashes
end

def sanitize(noko_doc)
  rows = extract_table_data(noko_doc)
  sanitized_rows = clean_up_data(rows)
  csv_writer(sanitized_rows)
  reservoir_hashes = parse_csv("reservoir_data.csv")
end


reservoir_hashes = sanitize(noko_doc)
# hashes = create_hashes(sanitized_rows)
# converted_hashes = convert_hashes(hashes)

