puts "Deleting db"
# if Rails.env.development?
  Booking.destroy_all
  Worksite.destroy_all
  User.destroy_all
# end


puts "Creating 4 users"
user_1 = User.create(email: "proprio@montagu.fr", password: "123456")
user_2 = User.create(email: "tony@worker.net", password: "123456")
user_3 = User.create(email: "hello@gmail.com", password: "123456")
user_4 = User.create(email: "goodbye@gmail.com", password: "123456")

puts "Creating 5 worksites"
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


puts "Creating five bookings in chateau de Montagu"
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
