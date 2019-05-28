require 'open-uri'
require 'nokogiri'

url = "https://www.rempart.com/participer-a-un-chantier/rechercher-chantier-benevoles-restauration-patrimoine/"
html_doc = Nokogiri::HTML(open(url).read)
urls = html_doc.search('.item a').map { |balise_a| balise_a.attribute('href').value }

urls.each do |url|
  noko = Nokogiri::HTML(open(url).read)
  img = noko.search('.side-photos img').attribute('src').value
  name = noko.search('.articleBody h1').text
  description = noko.search('#fiche p').children.first.text + noko.search('#fiche p').children[1].text
  themes = noko.search('.themes p').children.text
  address = noko.search('.situation h2').children.last.children.text
  w = Worksite.new(name: name, description: description, address: address)
  w.remote_photo_url = img
  w.save
end
