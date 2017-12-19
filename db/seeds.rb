# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yimeng = Doctor.create!(first_name: "Yimeng", last_name: "Yen", specialty: "ortho", location: "Boston", years_experience: 15 )

lee = Patient.create!(first_name: "Lee", last_name: "Chow", age: 32, username: "lee", password: "password", doctor: yimeng)
admin = Patient.create!(first_name: "admin", last_name: "admin", age: 0, username: "admin", password: "admin", role: 1, doctor: nil)

medication1 = Medication.create(name: "Sinemet")
medication2 = Medication.create(name: "Mirapex")
lee.patient_medications.create!(dosage: "100mg", freq_per_day:2, medication_id: medication1.id)
lee.patient_medications.create!(dosage: "200mg", freq_per_day:1, medication_id: medication2.id)

therapist1 = Therapist.create(first_name: "Nida", last_name: "Tansinsin", therapy_type: "Physical Therapy", years_experience: 10)
therapist2 = Therapist.create(first_name: "MC", last_name: "Cox", therapy_type: "Occupational Therapy", years_experience: 8)
lee.therapists << therapist1
lee.therapists << therapist2

exercise1 = Exercise.create!(name: "Squats", description: "Squat down then stand up", image: "https://www.cdn.spotebi.com/wp-content/uploads/2014/10/squat-exercise-illustration.jpg")
exercise2 = Exercise.create!(name: "Tandem Balance", description: "Squat down then stand up", image: "https://img.physera.com/exercise/9bc0622fc57257f8/original.png")
exercise3 = Exercise.create!(name: "Prone on Elbows", description: "Above", image: "http://2.bp.blogspot.com/-NnF80GJCk6E/TffcWo5ATTI/AAAAAAAAAHA/9Y8P7QIaj4M/s1600/lumbar-elbow.jpg")
exercise4 = Exercise.create!(name: "Lunges", description: "Lunge forward", image: "http://workoutlabs.com/wp-content/uploads/watermarked/Bodyweight_Walking_Lunge_F_WorkoutLabs.png")
exercise5 = Exercise.create!(name: "Single Leg Balance", description: "Squat down then stand up", image: "http://blog.eliteclubs.com/wp-content/uploads/2015/09/Single-Leg-Balance.png")
