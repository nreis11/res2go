users = 5.times do
  User.create!( :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :phone => Faker::PhoneNumber.cell_phone,
                :password   => 'password' )
end

reservoirs = reservoir_hashes.map { |reservoir_hash| Reservoir.create!(reservoir_hash) }

stats = 20.times do
  Stat.create!( user_id: rand(1..5),
                reservoir_id: rand(1..10),
                minimum_threshold: rand(20..30),
                maximum_threshold: rand(70..80)
                )
end
