# db/seeds.rb

# Create some authors
authors = Author.create!([
                           { first_name: "George", last_name: "Orwell", biography: "English novelist and essayist." },
                           { first_name: "Jane", last_name: "Austen", biography: "English novelist known for her six major novels." },
                           { first_name: "Mark", last_name: "Twain", biography: "American writer, humorist, entrepreneur, publisher, and lecturer." }
                         ])

# Create some genres
genres = Genre.create!([
                         { name: "Fiction" },
                         { name: "Science Fiction" },
                         { name: "Fantasy" },
                         { name: "Romance" },
                         { name: "Thriller" }
                       ])

# Create some books
books = Book.create!([
                       { title: "1984", number_of_copies: 5, isbn: "9780451524935", pages: 328, published_at: "1949-06-08", author: authors[0] },
                       { title: "Pride and Prejudice", number_of_copies: 3, isbn: "9780141439518", pages: 279, published_at: "1813-01-28", author: authors[1] },
                       { title: "Adventures of Huckleberry Finn", number_of_copies: 4, isbn: "9780486280615", pages: 366, published_at: "1884-12-10", author: authors[2] }
                     ])

# Associate books with genres
BookGenre.create!([
                    { book: books[0], genre: genres[0] },
                    { book: books[0], genre: genres[1] },
                    { book: books[1], genre: genres[0] },
                    { book: books[1], genre: genres[3] },
                    { book: books[2], genre: genres[0] },
                    { book: books[2], genre: genres[4] }
                  ])
# Create some users
users = User.create!([
                       { first_name: "Alice", last_name: "Smith", email: "alice@example.com", role: "member" },
                       { first_name: "Bob", last_name: "Johnson", email: "bob@example.com", role: "member" }
                     ])


# Create some ratings
Rating.create!([
                 { score: 5, review: "A must-read!", user: users[0], book: books[0] },
                 { score: 4, review: "Really enjoyed it.", user: users[1], book: books[1] },
                 { score: 3, review: "It was okay.", user: users[0], book: books[2] }
               ])
