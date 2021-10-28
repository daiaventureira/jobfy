# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(email: 'user@a.com.br', password: '123456')
project = Project.create!(title: "Test", skills: "testing", description: "description", price_per_hour: '230', deadline: DateTime.tomorrow, user: user)
professional = Professional.create!(email: "pro@pro2.com.br", password: "123456")
b_date = 19.years.ago
Profile.create(full_name: 'Juline Iza', social_name: "Iza", description: "hello", birth_date: b_date, educational_background: 'arts', experience: '2', professional: professional)
ProjectApplication.create!(introduction: 'Hello', professional: professional, project: project)    
