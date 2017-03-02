require 'nokogiri'
require 'open-uri'

ARGV.each_with_index do |arg, index|
  doc = Nokogiri::HTML(open(arg))
  doc.xpath("//meta[@property='og:image']/@content").each do |attr|
    url = attr.value
    open(index.to_s + '.jpg', 'wb') do |file|
      file << open(url).read
      puts 'Downloaded ' + arg + ' to ' + index.to_s + '.jpg'
    end
  end
end
