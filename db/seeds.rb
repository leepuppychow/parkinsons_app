# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(username: "admin", password: "password", uid: "admin", token: "token2")

yimeng = User.create(username: "yimenguser", password: "password", uid: "4321", token: "token2")
yimeng_doctor = Doctor.create!(name: "Yiming Yen", specialty: "ortho", location: "02312 Street Boston, MA", phone: "760-123-4567")
yimeng.doctor = yimeng_doctor
yimeng_doctor.note = Note.create(contents: "", noteable_id: yimeng.id, noteable_type: yimeng.class.name)

lee = User.create(username: "leeuser", password: "password", uid: "1234", token: "token1")
lee_patient = Patient.create!(first_name: "Lee", last_name: "Chow", age: 32)
lee.patient = lee_patient
# lee = Patient.create!(first_name: "Lee", last_name: "Chow", age: 32, username: "lee", uid: "hello", role: 2)
lee_patient.doctors << yimeng_doctor

# admin_patient = Patient.create!(first_name: "admin", last_name: "admin", age: 0)

lee_patient.activities.create!(duration: 30, date_performed: Date.today, description: "Hello")
lee_patient.activities.create!(duration: 40, date_performed: Date.today-1, description: "Hello")
lee_patient.activities.create!(duration: 60, date_performed: Date.today-2, description: "Hello")
lee_patient.activities.create!(duration: 45, date_performed: Date.today-3, description: "Hello")
lee_patient.activities.create!(duration: 100, date_performed: Date.today-5, description: "Hello")

medication1 = Medication.create(name: "Sinemet")
medication2 = Medication.create(name: "Mirapex")
pm1 = lee_patient.patient_medications.create!(dosage: "100mg", freq_per_day:2, medication_id: medication1.id)
pm2 = lee_patient.patient_medications.create!(dosage: "200mg", freq_per_day:1, medication_id: medication2.id)
pm1.note = Note.create(contents: "", noteable_id: pm1.id, noteable_type: pm1.class.name)
pm2.note = Note.create(contents: "", noteable_id: pm2.id, noteable_type: pm2.class.name)

user1 = User.create(username: "user1", password: "password", uid: "1", token: "tokenA")
therapist1 = Doctor.create(name: "Nida Tansinsin", specialty: "Physical Therapy", location: "02312 Street Boston, MA", phone: "760-123-4567")
user1.doctor = therapist1
therapist1.note = Note.create(contents: "", noteable_id: therapist1.id, noteable_type: therapist1.class.name)

user2 = User.create(username: "user2", password: "password", uid: "2", token: "tokenB")
therapist2 = Doctor.create(name: "MC Cox", specialty: "Occupational Therapy", location: "02312 Street Boston, MA", phone: "760-123-4567")
user2.doctor = therapist2
therapist2.note = Note.create(contents: "", noteable_id: therapist2.id, noteable_type: therapist2.class.name)

user3 = User.create(username: "user3", password: "password", uid: "3", token: "tokenC")
therapist3 = Doctor.create(name: "Amanda T", specialty: "Speech Therapy", location: "02312 Street Boston, MA", phone: "760-123-4567")
user3.doctor = therapist3
therapist3.note = Note.create(contents: "", noteable_id: therapist3.id, noteable_type: therapist3.class.name)

appointment1 = Appointment.create(date: Date.today, time: Time.now, status: "attended",
  doctor: yimeng_doctor)
appointment2 = Appointment.create(date: Date.today, time: Time.now, status: "late",
  doctor: therapist1)
appointment3 = Appointment.create(date: Date.today, time: Time.now, status: "late",
  doctor: therapist3)
appointment4 = Appointment.create(date: Date.today, time: Time.now, status: "late",
  doctor: therapist2)

lee_patient.doctors << [therapist1, therapist2, therapist3]
lee_patient.appointments << [appointment1, appointment2, appointment3, appointment4]

exercise1 = Exercise.create!(name: "Squats", description: "Squat down then stand up", image: "https://www.cdn.spotebi.com/wp-content/uploads/2014/10/squat-exercise-illustration.jpg")
exercise2 = Exercise.create!(name: "Tandem Balance", description: "Squat down then stand up", image: "https://img.physera.com/exercise/9bc0622fc57257f8/original.png")
exercise3 = Exercise.create!(name: "Prone on Elbows", description: "Above", image: "http://2.bp.blogspot.com/-NnF80GJCk6E/TffcWo5ATTI/AAAAAAAAAHA/9Y8P7QIaj4M/s1600/lumbar-elbow.jpg")
exercise4 = Exercise.create!(name: "Lunges", description: "Lunge forward", image: "http://workoutlabs.com/wp-content/uploads/watermarked/Bodyweight_Walking_Lunge_F_WorkoutLabs.png")
exercise5 = Exercise.create!(name: "Single Leg Balance", description: "Squat down then stand up", image: "http://blog.eliteclubs.com/wp-content/uploads/2015/09/Single-Leg-Balance.png")
