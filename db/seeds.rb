"Creating two users"
User.create(email: "proprio@montagu.fr")
User.create(email: "tony@worker.net")

"Creating a castle"
name = "Chateau de Montagu"
description = "Un samedi par mois, de 9h à 17h, venez entretenir les ruines du château de Montagu : desherbage, délierrage, nettoyage du site, entretien des vestiges, restauration de mobilier archéologique, taille de pierre."
address = "Montagu"
castle = Worksite.new(name: name, description: description, address: address)
castle.user = User.find(1)
castle.save

"Creating a booking"
booking = Booking.new(start_date: "01/07/2019", end_date: "15/07/2019")
booking.user = User.find(2)
booking.Worksite = Worksite.find(1)
