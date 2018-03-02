# Runescape Bot Stats

Runescape Bot stats is an API that allows scripters to easily track stats their scripts have accomplished.
![Runescape Bot Stats Eample](https://i.imgur.com/FhPmbF7.png)
## Getting Started with the API

* Sign up and add your script [here](https://pure-woodland-47666.herokuapp.com/scripts/new/)
* Find your API Key and Script ID [here](https://pure-woodland-47666.herokuapp.com/users/edit/)
* Send a POST request to upload your stats. We recommending sending 1 request on script end.

**Example Request:**

**URL:** http://pure-woodland-47666.herokuapp.com/api/v1/commits?user_email=YOUR_EMAIL&user_token=YOUR_API_KEY

**Body:**
```JSON
{"commit":{
    "script_id": "X5VTnp",
    "user_id": "qN4tOb",
    "runtime": 75,
    "stats_attributes": [
        {
            "task": "Trout Caught",
            "amount": 28
        },
        {
            "task": "Lobster Caught",
            "amount": 70
        }]
}}
```
### Parameter Notes
* At the very least, a commit requires `script_id`, `user_id`, and `runtime`
* `runtime` is in minutes
* `stats_attributes` are for tracking any sorts of tasks your script does. ex: Fish Caught, Yews Chopped, XP Gained, GP gained, etc.
* `user_id: qN4tOb` is the catch-all user. Use this as default.


<!--- 

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
--->
