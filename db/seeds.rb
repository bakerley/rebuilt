require 'open-uri'
require 'nokogiri'

puts "Deleting db"
# if Rails.env.development?
  Booking.destroy_all
  Worksite.destroy_all
  User.destroy_all
# end


puts "Creating our 4 lovely users"
user_1 = User.new(email: "proprio@montagu.fr", password: "123456", first_name: "Monsieur", last_name: "de Montagu")
user_1.remote_photo_url = "https://files.newsnetz.ch/story/1/6/3/16321488/2/topelement.jpg"
user_1.save
user_2 = User.new(email: "tony@worker.net", password: "123456", first_name: "Tony", last_name: "Rambouille")
user_2.remote_photo_url = "http://devis-maconnerie.org/wp-content/uploads/2014/09/maconnerie-gros-oeuvre-caudry-300x199.jpg"
user_2.save
user_3 = User.new(email: "John.rambo@gmail.com", password: "123456", first_name: "John", last_name: "Rambo")
user_3.remote_photo_url = "http://rockyrama.com/uploads/img/news/560-john-rambo-premier-et-ultime/big-john.png"
user_3.save
user_4 = User.new(email: "Pierre.Quiroule@gmail.com", password: "123456", first_name: "Pierre", last_name: "Quiroule")
user_4.remote_photo_url = "https://www.rollerquad.net/wp-content/uploads/2017/12/pierrequiroule.jpg"
user_4.save

puts "creating 20 users randomly"
20.times do
  user = User.new(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  user.remote_photo_url = Faker::Avatar.image("50x50")
  user.save
end

puts "Creating 5 beautiful worksites"
worksite_1 = Worksite.new(name: "Atelier ouvert en ébénisterie", address: "Nouvelle-Aquitaine", description: "Vous souhaitez travailler le bois en atelier dans le cadre d'un projet bénévole, d'une validation de stage ou d'un projet professionnel ? Pendant l'année scolaire, le Club Marpen vous accueille pour une initiation à l'ébénisterie, à la menuiserie et à la restauration de bois, selon votre projet.")
worksite_1.user = user_4
url = "https://i.pinimg.com/564x/12/0f/65/120f655ff8aa961558ed1ca3e5642438.jpg"
worksite_1.remote_photo_url = url
worksite_1.save!

worksite_2 = Worksite.new(name: "Atelier ouvert en taille de pierre", address: "Bretagne", description: "L'atelier de taille de pierre du centre de formation de Marpen est ouvert à toute personne qui s'intéresse à la pierre et au métier de tailleur de pierre.")
worksite_2.user = user_1
url = "https://i.pinimg.com/564x/4d/ba/af/4dbaaf0ba9c562e4ac502784fa6f187c.jpg"
worksite_2.remote_photo_url = url
worksite_2.save!

worksite_3 = Worksite.new(name: "Château de Brie-Comte-Robert", address: "Auvergne", description: "Le château accueille toute l'année des bénévoles pour faire avancer les nombreux projets de l'association : recherche en archives, études des objets mis au jour pendant la fouille (céramique, objets en fer, en verre, en alliages cuivreux), maçonnerie, taille de pierre, ateliers-patrimoine pour les enfants, accueil des adultes, etc.")
worksite_3.user = user_2
url = "https://i.pinimg.com/564x/7e/f6/38/7ef638cc26c0d046a987817694abe6af.jpg"
worksite_3.remote_photo_url = url
worksite_3.save!

worksite_4 = Worksite.new(name: "Entretien du château de Lastours", address: "Normandie", description: "Les bénévoles participent à la consolidation des ruines (XIIe-XVIe siècle), à leur mise en valeur et à leur animation. Il s'agit d'activités ponctuelles, sans hébergement. Contactez M.Ménard pour y participer.")
worksite_4.user = user_2
url = "https://i.pinimg.com/564x/ae/b7/5a/aeb75a087a19c030c998d21ef47dc13c.jpg"
worksite_4.remote_photo_url = url
worksite_4.save!

worksite_5 = Worksite.new(name: "Château de Montagu", address: "Ile-de-France", description: "Venez entretenir les ruines du château de Montagu : desherbage, délierrage, nettoyage du site, entretien des vestiges, restauration de mobilier archéologique, taille de pierre.")
worksite_5.user = user_1
url = "https://i.pinimg.com/564x/45/1a/63/451a63ab4c8f0d4b9f86df4df1033274.jpg"
worksite_5.remote_photo_url = url
worksite_5.save!

puts "Creating worksites by scrapping rempart.fr"

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
  w.user = User.all.sample
  w.remote_photo_url = img
  w.save
end


puts "Creating 3 bookings in Atelier en ébénisterie and 2 in chateau de Montagu"
booking = Booking.new(start_date: "01/07/2019", end_date: "15/07/2019")
booking.user = user_2
booking.worksite = worksite_5
booking.save

booking = Booking.new(start_date: "01/08/2019", end_date: "31/08/2019")
booking.user = user_2
booking.worksite = worksite_5
booking.save

booking = Booking.new(start_date: "01/07/2019", end_date: "31/07/2019")
booking.user = user_3
booking.worksite = worksite_5
booking.save

booking = Booking.new(start_date: "01/07/2019", end_date: "15/07/2019")
booking.user = user_1
booking.worksite = worksite_1
booking.save

booking = Booking.new(start_date: "01/07/2019", end_date: "31/07/2019")
booking.user = user_1
booking.worksite = worksite_1
booking.save
