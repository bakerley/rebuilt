puts "Deleting db"
if Rails.env.development?
  Booking.destroy_all
  Worksite.destroy_all
  User.destroy_all
end


puts "Creating two users"
User.create(email: "proprio@montagu.fr", password: "123456")
User.create(email: "tony@worker.net", password: "123456")

puts "Creating a castle"
name = "Chateau de Montagu"
description = "Un samedi par mois, de 9h à 17h, venez entretenir les ruines du château de Montagu : desherbage, délierrage, nettoyage du site, entretien des vestiges, restauration de mobilier archéologique, taille de pierre."
address = "Montagu"
url = "https://upload.wikimedia.org/wikipedia/commons/7/70/Ch%C3%A2teau_de_Montagu_2018.jpg"
castle = Worksite.new(name: name, description: description, address: address)
castle.user = User.find(User.pluck(:id).sample)
castle.remote_photo_url = url
castle.save

puts "Creating a booking"
booking = Booking.new(start_date: "01/07/2019", end_date: "15/07/2019")
booking.user = User.find(User.pluck(:id).sample)
booking.worksite = Worksite.find(Worksite.pluck(:id).sample)
booking.save
