
namespace :dev do 
  task fake: :environment do 
    Movie.destroy_all

    500.times do |i|
      Movie.create!(name: FFaker::Movie.title,
        year: FFaker::Vehicle.year,
        score: "#{rand(10).to_s}",
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
        )
    end
    puts "have create fake movies"
    puts "now you have #{Movie.count} moives data" 
  end
end