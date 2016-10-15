users = 5.times do
  User.create!( :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :phone => Faker::PhoneNumber.cell_phone,
                :password   => 'password' )
end

reservoirs = 10.times do
  Reservoir.create!( name: Faker::Address.city,
                     storage: Faker::Number.number(4),
                     capacity: Faker::Number.number(5)
                    )
end

users_reservoirs = 20.times do
  UsersReservoir.create!( user_id: rand(1..5),
                          reservoir_id: rand(1..10))
end