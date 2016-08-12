# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

##   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w{ albert bella carlos david edgar henry isco john }.each_with_index do |name, index|
	User.create!(:id => index, :username => name, :email => "#{name}@example", :password => name, :avatar_url => Faker::Avatar.image)
end

User.create!(:id => 29, :username => "An Vo", :email => "akira.an111@gmail.com", :password => "anvo")

t = Tour.create!(:title => "Du lich Phan Rang thap cham 4 ngay 3 dem", :fromplace => "Nga 4 Phu Nhuan, tp. Ho Chi Minh", :toplace => "tp. Thap Cham, tinh Phan Rang", :fromtime => DateTime.parse('Tue, 6 Sep 2016 7:00 AM+0700'), :totime => DateTime.parse('Sat, 10 Sep 2016 7:00 AM+0700'), :maxmember => 2, :creator_id => 29, :estimatebudget => 2000000, :deposit => 500000, :transport => "Tau lua", :description => "DI du lich 2 ngay 3 dem tai Phan Rang Thap Cham")

Tourimage.create!(:tour => t, :img_url => 'http://miendatphanrang.com/Uploads/images/THAP%20CHAM%20PHAN%20RANG%20NINH%20THUAN(1).jpg')

t.tag_list.add("bien", "nang", "gio")
Tourmember.create!(:tour => Tour.first, :member => User.find(0), :role => 'member', :status => 'pending')
Tourmember.create!(:tour => Tour.first, :member => User.find(1), :role => 'member', :status => 'pending')
Tourmember.create!(:tour => Tour.first, :member => User.find(2), :role => 'member', :status => 'approved')
Tourmember.create!(:tour => Tour.first, :member => User.find(3), :role => 'member', :status => 'rejected')
Tourmember.create!(:tour => Tour.first, :member => User.find(4), :role => 'member', :status => 'cancelled')
Tourmember.create!(:tour => Tour.first, :member => User.find(29), :role => 'member', :status => 'pending')

Tourcomment.create!(:tour => Tour.first, :commenter => User.find(5), :content => 'Ban co the up them nhieu hinh anh nua khong')
Tourcomment.create!(:tour => Tour.first, :commenter => User.find(6), :content => 'Minh dang ky them voi 2 ban nua duoc khong Ad')