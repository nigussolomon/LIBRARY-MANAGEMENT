# LMS
## A simple library management system api with rails

#### Contributors in this project

- Nigus Solomon
- Hawani Hashim
- Kaleab Anteneh
- Yeabsera Seyoum
- Aklog Sirak


### Dependencies needed
- Rails (https://guides.rubyonrails.org/getting_started.html)
- Docker (Dcoker-Compose)


## Steps in running the api...

### Step 1 - Getting Started
- Clone this repository or download the zip file for this repository
> git clone https://github.com/nigussolomon/LIBRARY-MANAGEMENT.git

### Step 2 - Installing Gems
- Install the required Gems
##### Go to the directory where you cloned or extracted the zip file
> bundle install

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

### For further exploring you can use postman to see the requests sent and recieved from the api...
