# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yimeng = Doctor.create!(first_name: "Yimeng", last_name: "Yen", specialty: "ortho", location: "Boston", years_experience: 15 )

lee = Patient.create!(first_name: "Lee", last_name: "Chow", age: 32, email: "ok@gmail.com", password: "okthen", doctor: yimeng)
