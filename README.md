# README

*Setup guide*

* ruby version - 2.7.1
* database - postgreSQL


* clone the repository to your local and run
1. bundle install
2. rails db:create
3. rails db:migrate
4. rails s
5. call API as below:

`curl --location --request GET 'http://localhost:3000/api/v1/apartments'`


`curl --location --request GET 'localhost:3000/api/v1/apartments?min_price=400&max_price=500&min_sqm=200&max_sqm=400&number_of_bedrooms=7'`

Output:
```
[
    {
        "id": 10,
        "title": "Consequatur facere tenetur.",
        "price": 409,
        "sqm": 279,
        "number_of_bedrooms": 7,
        "number_of_bathrooms": 4,
        "picture": "https://loremflickr.com/50/60/apartment",
        "created_at": "2021-04-20T18:47:54.833Z",
        "updated_at": "2021-04-20T18:47:54.833Z"
    }
]
```
