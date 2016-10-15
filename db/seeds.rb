users = 10.times do
  User.create!( :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

reservoirs = 20.times do
  Reservoir.create!( name: Faker::Address.city,
                     storage: Faker::Number.positive,
                     capacity: Faker::Number.positive,
                     user_id: rand(1..10) )
end
