# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w{ albert bella carlos david edgar henry isco john }.each_with_index do |name, index|
	User.create!(:id => index, :username => name, :email => "#{name}@example", :password => name)
end

User.create!(:id => 29, :username => "An Vo", :email => "akira.an111@gmail.com", :password => "anvo")

