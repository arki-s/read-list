# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning users..."

Record.destroy_all
Meeting.destroy_all
Book.destroy_all
User.destroy_all

user = User.create!(email:"test@test.com", password:"123456")
puts "create testuser"

date = Date.today

10.times do
 book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
 meeting = Meeting.create!(start_date: (date - rand(5)), end_date: (date + rand(5)), complete: false, book_id: book.id)
 Record.create!(book_id: book.id, meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)
end

puts "created #{Book.count} books"
puts "created #{Meeting.count} readings"
puts "created #{Record.count} records"
