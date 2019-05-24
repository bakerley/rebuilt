# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(email: "hello@gmail.com", password: "123456")
user.save!

user_2 = User.new (email: "goodbye@gmail.com", password: "123456")
user_2.save!

worksite_1 = Worksite.new(name: "Atelier ouvert en ébénisterie", address: "Nouvelle-Aquitaine", description: "Vous souhaitez travailler le bois en atelier dans le cadre d'un projet bénévole, d'une validation de stage ou d'un projet professionnel ? Pendant l'année scolaire, le Club Marpen vous accueille pour une initiation à l'ébénisterie, à la menuiserie et à la restauration de bois, selon votre projet.")
worksite_1.user = user
worksite_1.save!

worksite_2 = Worksite.new(name: "Atelier ouvert en taille de pierre", address: "Bretagne", description: "L'atelier de taille de pierre du centre de formation de Marpen est ouvert à toute personne qui s'intéresse à la pierre et au métier de tailleur de pierre.")
worksite_2.user = user
worksite_2.save!

worksite_3 = Worksite.new(name: "Château de Brie-Comte-Robert", address: "Auvergne", description: "Le château accueille toute l'année des bénévoles pour faire avancer les nombreux projets de l'association : recherche en archives, études des objets mis au jour pendant la fouille (céramique, objets en fer, en verre, en alliages cuivreux), maçonnerie, taille de pierre, ateliers-patrimoine pour les enfants, accueil des adultes, etc.")
worksite_3.user = user
worksite_3.save!

worksite_4 = Worksite.new(name: "Entretien du château de Lastours", address: "Normandie", description: "Les bénévoles participent à la consolidation des ruines (XIIe-XVIe siècle), à leur mise en valeur et à leur animation. Il s'agit d'activités ponctuelles, sans hébergement. Contactez M.Ménard pour y participer.")
worksite_4.user = user
worksite_4.save!

worksite_5 = Worksite.new(name: "Château de Montagu", address: "Ile-de-France", description: "Venez entretenir les ruines du château de Montagu : desherbage, délierrage, nettoyage du site, entretien des vestiges, restauration de mobilier archéologique, taille de pierre.")
worksite_5.user = user
worksite_5.save!
