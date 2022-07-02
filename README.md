# LMS
## A simple library management system api with rails

#### Contributors in this project and contributions

- Nigus Solomon (Configuration, Serialization, Testing)
- Hawani Hashim (Controller, Routing)
- Kaleab Anteneh (Angular, API Integration)
- Yeabsera Seyoum (Model, Testing)
- Aklog Sirak (Angular, API Integration)


### Dependencies needed
- Rails (https://guides.rubyonrails.org/getting_started.html)
- Docker (Dcoker-Compose / https://docs.docker.com/)


## Steps in running the api...

### Step 1 - Getting Started
- Clone this repository or download the zip file for this repository
> git clone https://github.com/nigussolomon/LIBRARY-MANAGEMENT.git

### Step 2 - Installing Gems
- Install the required Gems
##### Go to the directory where you cloned or extracted the zip file
> bundle install

##### If you have error installing the pg gem use the following 
- Linux
> sudo apt install libpq-dev build-essential
- OSX (MacOS)
> brew install postgresql

### Step 3 - Setting up enviroment
- Run the docker container
> docker-compose up -d
- Create the database inside the container
> rails db:create
- Migrate the models inside the database
> rails db:migrate

### Step 4 - Running the rails server
- To get and send request we initiate the rails server
> rails s

## Additional Feature you can use during development

### Using the pgadmin webpage interface
> To access the PGADMIN webpage use the following url http://localhost:5050
> If an error occurs make sure your pg_admin_1 container is running.

### For further exploring you can use postman to see the requests sent and recieved from the api
