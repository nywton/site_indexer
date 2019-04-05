# Site indexer

Site indexer is an application that index h1, h2, h3 and links elements from an URL. to Github Events via webhooks and expose by an api for later use.

Example: https://site-indexer.herokuapp.com
You may read the Json API **documentation** at: http://site-indexer.herokuapp.com/apidoc/index.html

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
    
* Example request:
    
    ````
    $ curl -i -H "Accept: application/vnd.api+json" -H 'Content-Type:application/vnd.api+json' -X POST -d '{"site":{"url": "https://nywton.herokuapp.com"}}' http://localhost:3000/sites

* How to run the test suite
    ````
    $ rspec
    

