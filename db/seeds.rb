# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

##   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tourimage.delete_all
Tourrating.delete_all
User.delete_all
Tour.delete_all

%w{ albert bella carlos david edgar henry isco john }.each_with_index do |name, index|
	User.create!(:id => index, :username => name, :email => "#{name}@example", :password => name, :avatar_url => Faker::Avatar.image)
end

User.create!(:id => 29, :username => "An Vo", :email => "akira.an111@gmail.com", :password => "anvo", :avatar_url => Faker::Avatar.image)

t = Tour.create!(:title => "Du lich Phan Rang thap cham 4 ngay 3 dem", :fromplace => "Nga 4 Phu Nhuan, tp. Ho Chi Minh", :toplace => "tp. Thap Cham, tinh Phan Rang", :fromtime => DateTime.parse('Tue, 6 Sep 2016 7:00 AM+0700'), :totime => DateTime.parse('Sat, 10 Sep 2016 7:00 AM+0700'), :maxmember => 2, :creator_id => 29, :estimatebudget => 2000000, :deposit => 500000, :transport => "Tau lua", :description => "DI du lich 2 ngay 3 dem tai Phan Rang Thap Cham. Thành phố Đà Nẵng nhận được rất nhiều mệnh danh như thành phố đáng sống, thành phố của những cây cầu, thành phố 5 không, 3 có. Không phải  tự nhiên mà thành phố Đà Nẵng nhận được nhiều mỹ từ để mô tả như vậy, đó là sự nỗ lực, cố gắng  của người dân cũng như chính quyền thành phố Đà Nẵng.  Đây cũng là cảm nhận chung của rất nhiều người khi đến, khám phá vẻ đẹp thiên nhiên, cũng như con người Đà Nẵng. 
Không chỉ đẹp bởi vẻ đẹp đa dạng của thiên nhiên núi, sông, bãi biển, mà cả con người nơi đây cũng rất đẹp, với những nụ cười thân thiện luôn nở trên môi.
Thành phố Đà Nẵng nằm ở miền Trung Việt Nam, ở giữa trung tâm Thủ Đô Hà Nôi và Thành phố sôi động nhất cả nước Hồ Chí Minh. Rất dễ tiếp dàng cho du khách tiếp cận, Đà Nẵng có sân bay quốc tế với công suất 6 triệu khách/năm và hiện có nhiều đường bay trực tiếp quốc tế. Cảng nước sâu Tiên Sa là nơi thường xuyên tiếp nhận du thuyền cao cấp, đưa du khách đến với Đà Nẵng. Đà Nẵng còn là trạm dừng chính của các tuyến xe lửa và xe khách.  Ngoài ra, nó cũng mang nét hấp dẫn riêng biệt bởi vị thế tựa lưng vào dải Trường Sơn hùng vĩ, lại có bán đảo Sơn Trà vươn ra biển. Bên cạnh đó, Đà Nẵng rất gần với những di sản văn hóa nổi tiếng không chỉ ở nước ta mà cả thế giới đó là Cố Đô Huế và phố cổ Hội An và Thánh Địa Mỹ Sơn. Từ Đà Nẵng du khách có thể di chuyển dễ dàng và nhanh chóng đến các địa điểm này.

Cau Rong Da Nang

Môi trường sống an toàn

Mặc dù là một thành phố lớn của cả nước nhưng nơi đây trong lành và yên bình, rất hiếm khi xảy ra tình trạng kẹt xe, thành phố rất an ninh trật tự, không có người lang thang xin ăn, không có người nghiện ma túy trong cộng đồng. Cho nên du khách có thể hoàn toàn an tâm khi đi du lịch Đà Nẵng, thỏa mái khám phá những góc phố, con đường mà mình muốn đi.

Bien Da Nang

Bãi biển tuyệt đẹp

Cùng với Nha Trang, Vũng Tàu, Đà Nẵng là một trong những thành phố Biển xinh đẹp được nhiều người lựa chọn để giải nhiệt trong mùa hè.  Đà Nẵng với bãi biển dài hơn 60 Km, được tạp chí Forbes của Mỹ bình chọn là 1 trong 6 bãi biển quyến rũ nhất hành tinh. Hòa mình vào dòng nước biển xanh biếc, tắm nắng trên những biển cát mịn sẽ giúp cho du khách có trải nghiệm ngày hè thật thú vị. Không những vậy, có rất nhiều dịch vụ biển cho bạn trải nghiệm như canoing, dù kéo, lướt ván, chèo thuyền chuối, motor nước, lặn biển ngắm san hô. Một số bãi biển tuyệt đẹp ở Đà Nẵng mà du khách có thể ghé thăm như bãi biển Nam Ô, bãi biển Xuân Thiều, bãi biển Non Nước, bãi biển Thanh Bình, …

Canh bien da nang

 Du lịch sinh thái lý tưởng

Nhắc đến Đà Nẵng không thể không nhắc đến khu du lịch sinh thái Bà Nà ngày càng hấp dẫn du khách với hệ thống cáp treo đạt 2 kỷ lục thế giới và khu vui chơi giải trí trong nhà lớn nhất Đông Nam Á – Fantasy Park. Với khí hậu mát mẻ quanh năm, đây được ví như là Đà Lạt của Miền Trung nên thu hút rất du khách ghé thăm.

Hay du khách có thể ghé thăm bán đảo Sơn Trà – khu rừng giữa thành phố với hệ động thực vật phong phú, với những bãi tắm hoang sơ mấp mô ghềnh đá. Rồi ngược về Đông Nam lại là danh thắng Ngũ Hành Sơn, không chỉ chứa đựng vẻ đẹp thiên nhiên mà còn có bề dày giá trị văn hóa và tôn giáo.

Những địa điểm du lịch sinh thái ở Đà Nẵng chắc chắn sẽ giúp du khách có những giây phút nghỉ ngơi, thư giãn trọn vẹn để lấy lại năng lượng làm việc, học tập tốt hơn.

Cau Rong Da Nang

Thành phố của những cây cầu độc đáo

Nói đến Đà Nẵng không thể không thể không nhắc đến những cây cầu độc đáo, đây là niềm tự hào của người dân thành phố Đà Nẵng.

Một số cây cầu điển hình mà du lịch không nên bỏ qua khi đến Đà Nẵng: Đó là Cầu Quay sông Hàn – cây cầu nổi tiếng bởi sự độc nhất vô nhị của nó. Cây cầu nối liền hai bờ sông Hàn với chiều dài 487,7m. Đúng 12h đêm, thời khắc cây cầu từ từ chuyển mình, rời hai bờ để xuôi theo dòng sông, giúp cho tàu thuyền qua lại dễ dàng hơn. Và đến khoảng 3h30 sáng, cây cầu lại trầm mặc với vị trị cũ, chờ đón mọi người qua lại vào một ngày mới.

Tiếp theo phải kể đến Cầu treo dây võng Thuận Phước. Cây cầu là đường nối liền thành phố với cảng biển Tiên Sa tuyệt đẹp. Cây cầu dây võng dài nhất Việt Nam, nối Cây cầu nối bán đảo Sơn Trà và quận Hải Châu, là chiếc chìa khóa vàng cho Du Lịch ở Sơn Trà.

Kế tiếp là cầu Nguyễn Văn Trỗi được ví như  “Nàng Lọ Lem” của Đà Nẵng.  Đây là một cây cầu được nối từ các ống thép, hiện vẫn là một trong những cây cầu có kiến trúc lạ và đẹp của thành phố Đà Nẵng.

Không thể không nhắc đến cầu Rồng nối dài tuyến đường Nguyễn Văn Linh từ sân bay quốc tế Đà Nẵng đến đường Hoàng Sa – Trường Sa. Cầu Rồng mô phỏng hình con rồng mạnh mẽ vươn ra biển. Đây là sự kết hợp hài hòa giữa nghệ thuật và công năng, và là sự hấp dẫn hàng đầu đối với du khách. Đặc biệt vào 21 h tối thứ 7, chủ nhật hàng tuần, các ngày lễ lớn, du khách sẽ được chiêm ngưỡng rồng phun nước và lửa.

Chua Linh Ung

Du lịch tâm linh linh thiêng

Ngoài biển, du lịch thì thái  thì những điểm đến liên quan đến tôn giáo tín ngưỡng như Nhà thờ, giáo xứ, chùa chiền…. ở Đà Nẵng đều rất khang trang, nằm ở vị trí thuận lợi cho khách đến tham quan, du lịch hoặc thực hiện một số hoạt động tâm linh.

Ở Đà Nẵng, có rất nhiều chùa lớn, khang trang trên các núi lớn, như: Chùa Linh Ứng Bà Nà, Chùa Linh Ứng trên bán đảo Sơn Trà, chùa Non Nước ở dãy ngũ hành Sơn…. Hoặc các nhà thờ lớn như Nhà Thờ con gà, Nhà thờ tin lành….những điểm đến này rất thu hút khách du lịch đến tham quan, và thực hiện nhiều hoạt động mang ý nghĩa về tâm linh.

Ẩm thực hương vị tuyệt vời 

Đến với Đà Nẵng, du khách sẽ được thưởng thức nhiều món ăn đặc sản như mì Quảng, bánh tráng thịt heo, bún chả cá, bánh xèo, bánh bèo, bê thui Cầu Mống, hải sản tươi sống…Ăn một lần du khách sẽ nhớ mãi, và muốn được quay lại để thưởng thức nhiều lần hơn nữa.")

Tourimage.create!(:tour => t, :img_url => 'http://miendatphanrang.com/Uploads/images/THAP%20CHAM%20PHAN%20RANG%20NINH%20THUAN(1).jpg')

t.tag_list.add("bien", "nang", "gio")
Tourmember.create!(:tour => t, :member => User.find(0), :role => 'member', :status => 'pending')
Tourmember.create!(:tour => t, :member => User.find(1), :role => 'member', :status => 'pending')
Tourmember.create!(:tour => t, :member => User.find(2), :role => 'member', :status => 'approved')
Tourmember.create!(:tour => t, :member => User.find(3), :role => 'member', :status => 'rejected')
Tourmember.create!(:tour => t, :member => User.find(4), :role => 'member', :status => 'cancelled')
Tourmember.create!(:tour => t, :member => User.find(29), :role => 'member', :status => 'pending')

Tourcomment.create!(:tour => t, :commenter => User.find(5), :content => 'Ban co the up them nhieu hinh anh nua khong')
Tourcomment.create!(:tour => t, :commenter => User.find(6), :content => 'Minh dang ky them voi 2 ban nua duoc khong Ad')
Tourcomment.create!(:tour => t, :commenter => User.find(3), :content => 'up thêm hình được không ad')

t.rated_up_by(User.find(1))
t.rated_up_by(User.find(2))
t.rated_up_by(User.find(3))
t.rated_down_by(User.find(4))


t2 = Tour.create!(:title => "Du lich Da Nang Hoi An 7 ngay", :fromplace => "Nga 4 Phu Nhuan, tp. Ho Chi Minh", :toplace => "tp. Thap Cham, tinh Phan Rang", :fromtime => DateTime.parse('Tue, 6 Sep 2016 7:00 AM+0700'), :totime => DateTime.parse('Sat, 10 Sep 2016 7:00 AM+0700'), :maxmember => 2, :creator_id => 4, :estimatebudget => 2000000, :deposit => 500000, :transport => "Tau lua", :description => "DI du lich 2 ngay 3 dem tai Phan Rang Thap Cham")
Tourimage.create!(:tour => t2, :img_url => 'http://dranahotel.com/upload/anh%20Thohtn/1.jpg')
t2.tag_list.add("bien", "cau rong")