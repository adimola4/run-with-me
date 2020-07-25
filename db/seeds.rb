# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Training.destroy_all
Partners.destroy_all

p "loading new data..."

require 'faker'


7.times do
    psw=Faker::Internet.password(min_length: 8)
    user=User.create( password: psw ,
                 email: Faker::Internet.email,
                 name: Faker::Name.name,
                 password_confirmation:psw)   
    p "success: Add User"

    7.times do 
          Training.create( title: Faker::Sports::Football.position ,
             date: Faker::Date.forward(days: 60),
             duration: "1.5 h" , 
             participants: Faker::Number.between(from: 1, to: 5) ,
             user_id: user.id, 
             Location: Faker::Address.full_address,
             published: Faker::Boolean.boolean,
             status:  Faker::Number.between(from: 1, to: 3))
    end
    p "success: Add Trainings"

end
25.times do
    p Partners.create(user_id:Faker::Number.between(from: 120, to: 127),
    training_id:Faker::Number.between(from: 150, to: 200))
    
end
p "success: Add Partner"

p "finish work!"