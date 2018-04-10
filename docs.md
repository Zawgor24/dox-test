FORMAT: 1A

# Polls

Polls is a simple API allowing consumers to view polls and vote in them.

Dox Example
This api is implemented according to the JSON API spec.

Filter
If you want to filter your query, you can do so by setting the supported filter parameters in the following way:

?user_id=24

# Group Users


## Users [/users]
Supported filter params
user_id

### Get users [GET /api/v1/users]


+ Request returns a list of users
**GET**&nbsp;&nbsp;`/api/v1/users`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body



### Get a user [GET /api/v1/users/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request returns a single user
**GET**&nbsp;&nbsp;`/api/v1/users/1`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "id": 1,
              "name": "Ms. Nora Friesen",
              "email": "bruce@strosin.info",
              "age": 21,
              "created_at": "2018-04-10T20:16:55.834Z",
              "updated_at": "2018-04-10T20:16:55.834Z"
            }

+ Request does not return any user
**GET**&nbsp;&nbsp;`/api/v1/users/invalid_id`

    + Headers



+ Response 404

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "detail": "Couldn't find User with 'id'=invalid_id"
                }
              ]
            }

### Create a user [POST /api/v1/users]


+ Request creates a new user
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            age=21&email=christiana.kaulke%40schimmel.biz&name=Christiana+Brekke+PhD

+ Response 201

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "id": 1,
              "name": "Christiana Brekke PhD",
              "email": "christiana.kaulke@schimmel.biz",
              "age": 21,
              "created_at": "2018-04-10T20:16:55.847Z",
              "updated_at": "2018-04-10T20:16:55.847Z"
            }

+ Request returns unprocessable entity
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            age=21&email=&name=Frederick+Labadie

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "translation missing: en.json_api.errors.unprocessable_entity.title",
                  "detail": "Email can't be blank",
                  "source": {
                    "parameter": "email",
                    "pointer": "data/attributes/email"
                  }
                }
              ]
            }

+ Request does not create a new user
**POST**&nbsp;&nbsp;`/api/v1/users`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            age=21&email=&name=Lucas+Mueller+MD

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "translation missing: en.json_api.errors.unprocessable_entity.title",
                  "detail": "Email can't be blank",
                  "source": {
                    "parameter": "email",
                    "pointer": "data/attributes/email"
                  }
                }
              ]
            }

### Update a user [PUT /api/v1/users/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request updates the user
**PUT**&nbsp;&nbsp;`/api/v1/users/1`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            email=updated%40email.com

+ Response 200

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "id": 1,
              "email": "updated@email.com",
              "name": "Flo Mohr MD",
              "age": 21,
              "created_at": "2018-04-10T20:16:55.864Z",
              "updated_at": "2018-04-10T20:16:55.867Z"
            }

+ Request returns unprocessable entity
**PUT**&nbsp;&nbsp;`/api/v1/users/1`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            email=

+ Response 422

    + Headers

            Content-Type: application/vnd.api+json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "title": "translation missing: en.json_api.errors.unprocessable_entity.title",
                  "detail": "Email can't be blank",
                  "source": {
                    "parameter": "email",
                    "pointer": "data/attributes/email"
                  }
                }
              ]
            }

### Delete a user [DELETE /api/v1/users/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request returns 204 status
**DELETE**&nbsp;&nbsp;`/api/v1/users/1`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 204
