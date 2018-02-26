# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Category 
Category.destroy_all

category_list = [
  {name: "劇情片" },
  {name: "恐怖片" },
  {name: "戰爭片" },
  {name: "喜劇片" },
  {name: "浪漫片" },
  {name: "動作片" },
  {name: "科幻片" },
  {name: "音樂劇" },
  {name: "動畫片" },
]

category_list.each do |category|
  Category.create( name: category[:name] )
end

puts "Category created!!"

# Create Default admin
User.create(email: "root2@example.com", password: "12345678", role: "admin")
puts "Default admin created!"

