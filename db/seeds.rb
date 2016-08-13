User.create!( name: "Administrator",
			  			username: "admin",
              email: "admin@travelgo.com",
              password: "foobar",
              password_confirmation: "foobar",
              admin: true,
              activated: true,
              activated_at: Time.zone.now)
              
99.times do |n|
	name = Faker::Name.name
  username  = Faker::Name.first_name+"#{n+1}"
  email = Faker::Internet.safe_email(username)
  User.create!(name: name,
               username:  username,
               email: email,
               password:              "password",
               password_confirmation: "password",
               activated: true,
               activated_at: Time.zone.now)
end