# README

This Rails app is a simple app made as a part of the Library project for a "Informacijski sustavi" college course on FER.

The app is a simple library system with books, authors, book ratings, book genres and users. 
It allows librarians to manage their library catalogue by creating, updating and deleting books, authors, genres and ratings.

## Running the app
For running the app, you only have to clone the repository and run the following commands:

Only pre-requisite is to have docker installed on your machine.

### Steps to run the app:
1. Clone the repository
2.Check if you have docker installed by running the following commands:
```bash
docker --version
docker-compose --version
```
3. Open a terminal and go to the root of the cloned project
4. Run the following command to build the docker image:
```bash
docker-compose build
docker-compose up
```
5. Open a new terminal and run the following command to create the database:
```bash
docker-compose run web bundle exec rake db:create db:migrate db:seed
```

That's it! You can now test the app on your browser or with other tools like Postman by going to the following URL:
```
http://localhost:3000
```

#### Open endpoints
**Books**
- GET api/books
- GET api/books/:id
- POST api/books
- PATCH api/books/:id
- DELETE api/books/:id

**Authors**
- GET api/authors
- GET api/authors/:id
- POST api/authors
- PATCH api/authors/:id
- DELETE api/authors/:id

**Genres*
- GET api/genres

**Ratings**
- GET api/ratings
- GET api/ratings/:id
- POST api/ratings
- PATCH api/ratings/:id
- DELETE api/ratings/:id

#### Example requests

**Books**
```json
{
    "data": {
        "type": "books",
        "attributes": {
            "title": "The Great Gatsby",
            "number_of_copies": 11,
            "isbn": "9780743272265",
            "pages": 180,
            "published_at": "1925-04-10"
        },
        "relationships": {
            "author": {
                "data": {
                    "type": "authors",
                    "id": "1"
                }
            },
            "genres": {
                "data": [
                    {
                        "type": "genres",
                        "id": "2"
                    },
                    {
                        "type": "genres",
                        "id": "3"
                    }
                ]
            }
        }
    }
}
```