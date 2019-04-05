# Site indexer

Site indexer is an application that index h1, h2, h3 and links elements from an URL.

Example: https://site-indexer-api.herokuapp.com

* Ruby version
    - 2.5.1
* Rails version
     - 5.2.3
* Database
    - The project is default configured with **postgresql** database and **gem pg**
    - You can change the database adapter on **database.yml**. Remember to add the required dependencies
* Configuration
    - Rename ".env.sample" to ".env"
    - Change database variables (DB_USERNAME, DB_PASSWORD) 
    - Run docker-compose
* Database configuration:
    
    ````
    $ docker-compose up #for docker users
    $ rake db:create
    $ rake db:migrate
    
* Example Index Site Request:
    
    ````
    $ curl -d '{"data": {"type":"sites", "attributes":{"url":"https://nywton.herokuapp.com"}}}' -X POST -H "Content-Type: application/vnd.api+json" http://localhost:3000/site

* Example get Sites:
    
    ````
    $ curl http://localhost:3000/sites

* How to run the test suite
    ````
    $ rspec
    

