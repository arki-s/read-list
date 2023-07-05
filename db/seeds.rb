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

time = Date.today

book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
meeting = Meeting.create!(start_time: time + 1, end_time: time + 5, complete: false, book_id: book.id, user_id: user.id)

book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
meeting = Meeting.create!(start_time: time, end_time: time, complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: "THE GIRL ON THE TRAIN", author: "Paula Hawkins", user_id:user.id)
meeting = Meeting.create!(start_time: (time - rand(5)), end_time: (time + rand(3)), complete: false, book_id: book.id, user_id: user.id)

book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
meeting = Meeting.create!(start_time: (time - 10 - rand(5)), end_time: (time - 10 + rand(5)), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: "Jennie", author: "Paul Gallico", user_id:user.id)
meeting = Meeting.create!(start_time: (time - 12), end_time: (time - 12), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: "The Third lie", author: "Agota Kristof", user_id:user.id)
meeting = Meeting.create!(start_time: (time - 15 - rand(5)), end_time: (time - 15 + rand(5)), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: "Elizabeth is missing", author: "Emma Healey", user_id:user.id)
meeting = Meeting.create!(start_time: (time - 22 - rand(5)), end_time: (time - 22 + rand(5)), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
meeting = Meeting.create!(start_time: (time - 30), end_time: (time - 29), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: "Mr. Vertigo", author: "Paul Auster", user_id:user.id)
meeting = Meeting.create!(start_time: (time - 32), end_time: (time - 32), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
meeting = Meeting.create!(start_time: (time - 37), end_time: (time - 37), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
meeting = Meeting.create!(start_time: (time - 38), end_time: (time - 34), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: "The Proof", author: "Agota Kristof", user_id:user.id)
meeting = Meeting.create!(start_time: (time - 42), end_time: (time - 42), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: Faker::Book.title, author: Faker::Book.author, user_id:user.id)
meeting = Meeting.create!(start_time: (time - 45), end_time: (time - 44), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)

book = Book.create!(title: "The notebook", author: "Agota Kristof", user_id:user.id)
meeting = Meeting.create!(start_time: (time - 50), end_time: (time - 49), complete: true, book_id: book.id, user_id: user.id)
Record.create!(meeting_id: meeting.id, rating: rand(1..5), review: Faker::Restaurant.review)



puts "created #{Book.count} books"
puts "created #{Meeting.count} readings"
puts "created #{Record.count} records"
