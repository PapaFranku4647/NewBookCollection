# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
UserBook.destroy_all
User.destroy_all
Book.destroy_all

# Create sample books
book1 = Book.create!(title: 'The Great Gatsby')
book2 = Book.create!(title: 'To Kill a Mockingbird')
book3 = Book.create!(title: '1984')
book4 = Book.create!(title: 'Pride and Prejudice')
book5 = Book.create!(title: "Dr. Fart's Trip to Brussels")

# Create sample users
user1 = User.create!(username: 'alice')
user2 = User.create!(username: 'bob')
user3 = User.create!(username: 'charlie')
user4 = User.create!(username: 'diana')

# Create sample user_books (relationships between users and books)
UserBook.create!(user: user1, book: book1)
UserBook.create!(user: user1, book: book3)
UserBook.create!(user: user2, book: book2)
UserBook.create!(user: user2, book: book4)
UserBook.create!(user: user3, book: book1)
UserBook.create!(user: user3, book: book5)
UserBook.create!(user: user4, book: book3)
UserBook.create!(user: user4, book: book4)

puts "Created #{User.count} users, #{Book.count} books, and #{UserBook.count} user-book relationships"

# Create sample users
u1 = User.find_or_create_by!(username: 'alice')
u2 = User.find_or_create_by!(username: 'bob')
u3 = User.find_or_create_by!(username: 'charlie')

# Associate some books to users
books = Book.all.to_a
User.find_each do |user|
  books.sample(2).each do |book|
    UserBook.find_or_create_by!(user: user, book: book)
  end
end
