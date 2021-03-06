# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name: 'Saryn')
user2 = User.create(name: 'Kate')
user3 = User.create(name: 'Dan')
user4 = User.create(name: 'Tyler')
candy = user1.photos.create(source: 'app/assets/images/candy.jpg', title: 'Candy', description: 'I love all candy, but Smarties are my fave')
coding = user1.photos.create(source: 'app/assets/images/coding.jpeg', title: 'Coding', description: 'I am thrilled to be a programmer, and cannot wait to continue my learning journey')
coffee_and_rain = user2.photos.create(source: 'app/assets/images/coffee_and_rain.jpg', title: 'Coffee and Rain', description: 'I am incapable of living without my coffee, and I absolutely love the rain')
corgi = user2.photos.create(source: 'app/assets/images/corgi.jpeg', title: 'Corgi', description: 'Corgis are odd, but that is why I enjoy them')
tennis = user3.photos.create(source: 'app/assets/images/federer.jpg', title: 'Tennis', description: 'Tennis is a big part of my life, and Roger Federer is the GOAT. I admire his kindness, grace, and humility')
rivals = user3.photos.create(source: 'app/assets/images/friendly_rivals.jpg', title: 'Rivals', description: 'The greatest tennis rivals of all time. And at the same time, great friends')
golden_retriever = user4.photos.create(source: 'app/assets/images/golden_retriever.jpg', title: 'Golden Retriever', description: 'A best friend')
psychology = user4.photos.create(source: 'app/assets/images/psychology.png', title: 'Psychology', description: 'My other passion is studying the human mind and advocating for mental health')
