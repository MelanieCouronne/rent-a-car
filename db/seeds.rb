# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(first_name:"Melanie",last_name:"Couronne",presentation:"Duis non porta arcu, vehicula lobortis tortor. Aliquam pharetra, arcu vel placerat mollis, odio nibh commodo augue, eget blandit turpis ex vel nibh.",email:"melanie@gmail.com",password:"azerty")
Ride.create!(user_id:1,pickup_location:"Bordeaux", checkout_location:"Paris",passengers:3,car_model:"Sandero",car_brand:"Dacia",rental_rate:25,pickup_datetime:Date.today)
