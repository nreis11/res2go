users = 5.times do
  User.create!( :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :phone => Faker::PhoneNumber,
                :password   => 'password' )
end

reservoirs = 20.times do
  Reservoir.create!( name: Faker::Address.city,
                     storage: Faker::Number.number(4),
                     capacity: Faker::Number.number(5)
                    )
end

# users_reservoirs =
