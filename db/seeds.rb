require 'csv'
require 'nokogiri'
require 'open-uri'

Climb.destroy_all
Image.destroy_all

files = Dir.glob("**/*.csv")

filepaths = []

i = 0

files.each do |file|
  filepaths << Rails.root.join(file)
end

puts filepaths.length


filepaths.each do |file|

  csv_text = File.read(file)
  csv = CSV.parse(csv_text, headers: true)

  csv.each do |row|
    Climb.create(
      :route => row['Route'],
      :location => row['Location'],
      :url => row['URL'],
      :avgstars => row['Avg Stars'],
      :yourstars => row['Your Stars'],
      :routetype => row['Route Type'],
      :rating => row['Rating'],
      :pitches => row['Pitches'],
      :length => row['Length'],
      :latitude => row['Area Latitude'],
      :longitude => row['Area Longitude']
    )
    i = i + 1
    puts "Imported climb ##{i}!"

    # Todo
    # Check for empty array and pass if empty

    begin
      a = Nokogiri::HTML(open(Climb.last.url))
    rescue NoMethodError => e
      puts e
    end

    begin
      b = a.css("div.card-with-photo a").map { |link| link['href'] }
    rescue NoMethodError => e
      puts e
    end

    begin
      c = b.map { |link| Nokogiri::HTML(open(link)) }
    rescue NoMethodError => e
      puts e
    end

    begin
      d = c.map { |link| link.css("img.main-photo").attr('src').value}
      d.each do |image_url|
        Image.create(climb_id: Climb.last.id, url: image_url)
      end
    rescue NoMethodError => e
      puts e
    end
  end
end
