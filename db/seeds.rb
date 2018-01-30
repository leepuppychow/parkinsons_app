# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yimeng = Doctor.create!(name: "Yiming Yen", specialty: "ortho", location: "02312 Street Boston, MA", phone: "760-123-4567")
yimeng.note = Note.create(contents: "", noteable_id: yimeng.id, noteable_type: yimeng.class.name)
lee = Patient.create!(first_name: "Lee", last_name: "Chow", age: 32, username: "lee", password: "password", role: 2)
lee.doctors << yimeng

admin = Patient.create!(first_name: "admin", last_name: "admin", age: 0, username: "admin", password: "admin", role: 1)

lee.activities.create!(duration: 30, date_performed: Date.today, description: "Hello")
lee.activities.create!(duration: 40, date_performed: Date.today-1, description: "Hello")
lee.activities.create!(duration: 60, date_performed: Date.today-2, description: "Hello")
lee.activities.create!(duration: 45, date_performed: Date.today-3, description: "Hello")
lee.activities.create!(duration: 100, date_performed: Date.today-5, description: "Hello")

medication1 = Medication.create(name: "Sinemet")
medication2 = Medication.create(name: "Mirapex")
pm1 = lee.patient_medications.create!(dosage: "100mg", freq_per_day:2, medication_id: medication1.id)
pm2 = lee.patient_medications.create!(dosage: "200mg", freq_per_day:1, medication_id: medication2.id)
pm1.note = Note.create(contents: "", noteable_id: pm1.id, noteable_type: pm1.class.name)
pm2.note = Note.create(contents: "", noteable_id: pm2.id, noteable_type: pm2.class.name)

therapist1 = Therapist.create(name: "Nida Tansinsin", specialty: "Physical Therapy", location: "02312 Street Boston, MA", phone: "760-123-4567")
therapist1.note = Note.create(contents: "", noteable_id: therapist1.id, noteable_type: therapist1.class.name)
therapist2 = Therapist.create(name: "MC Cox", specialty: "Occupational Therapy", location: "02312 Street Boston, MA", phone: "760-123-4567")
therapist2.note = Note.create(contents: "", noteable_id: therapist2.id, noteable_type: therapist2.class.name)
therapist3 = Therapist.create(name: "Amanda T", specialty: "Speech Therapy", location: "02312 Street Boston, MA", phone: "760-123-4567")
therapist3.note = Note.create(contents: "", noteable_id: therapist3.id, noteable_type: therapist3.class.name)

appointment1 = Appointment.create(date_time: DateTime.now, status: "attended",
  appointable_id: yimeng.id, appointable_type: yimeng.class.name)
appointment2 = Appointment.create(date_time: DateTime.now, status: "late",
  appointable_id: therapist1.id, appointable_type: therapist1.class.name)
appointment3 = Appointment.create(date_time: DateTime.now, status: "late",
  appointable_id: therapist3.id, appointable_type: therapist3.class.name)

lee.therapists << [therapist1, therapist2]
lee.appointments << [appointment1, appointment2, appointment3]

exercise1 = Exercise.create!(name: "Squats", description: "Squat down then stand up", image: "https://www.cdn.spotebi.com/wp-content/uploads/2014/10/squat-exercise-illustration.jpg")
exercise2 = Exercise.create!(name: "Tandem Balance", description: "Squat down then stand up", image: "https://img.physera.com/exercise/9bc0622fc57257f8/original.png")
exercise3 = Exercise.create!(name: "Prone on Elbows", description: "Above", image: "http://2.bp.blogspot.com/-NnF80GJCk6E/TffcWo5ATTI/AAAAAAAAAHA/9Y8P7QIaj4M/s1600/lumbar-elbow.jpg")
exercise4 = Exercise.create!(name: "Lunges", description: "Lunge forward", image: "http://workoutlabs.com/wp-content/uploads/watermarked/Bodyweight_Walking_Lunge_F_WorkoutLabs.png")
exercise5 = Exercise.create!(name: "Single Leg Balance", description: "Squat down then stand up", image: "http://blog.eliteclubs.com/wp-content/uploads/2015/09/Single-Leg-Balance.png")
