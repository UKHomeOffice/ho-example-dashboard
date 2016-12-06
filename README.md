# HO Example Dashboard
This repo is here to provide a quick and easy way for teams to get running with a basic dashboard.
Over time it will be expanded with more features.

For a richer dashboarding experience we recommend forking this repo and customizing the dashboard to your heart's content.

The dahsboard is built on Smashing - check out http://smashing.github.io/ for more information.

## Deploying with kubernetes
Details TBC...

## Running the dashboard
You can run the dashboard locally or with docker. Passing in environment variables lets you specify github credentials 
and the repos you wish to monitor. If you don't specify github credentials it will still work with public repos, 
but the rate limit will be lower.

### Running the dashboard with docker
```
git clone https://github.com/UKHomeOffice/ho-example-dashboard.git
cd ho-example-dashboard
docker build -t my-dashboard . 
docker run -ti -p 3030:3030 -e GITHUB_REPOS=UKHomeOffice/my-project-1,UKHomeOffice/my-project2 -e GITHUB_USERNAME=myusername GITHUB_PASSWORD=mypassword my-dashboard
```
You will find the dashboard on http://localhost:3030

### Running the dashboard locally
```
git clone https://github.com/UKHomeOffice/ho-example-dashboard.git
cd ho-example-dashboard
bundle install
GITHUB_REPOS=UKHomeOffice/my-project-1,UKHomeOffice/my-project2 -e GITHUB_USERNAME=myusername GITHUB_PASSWORD=mypassword smashing start
```
You will find the dashboard on http://localhost:3030

## Running tests
Tests are written with rspec, to run them do:
```
cd ho-example-dashboard
rspec
```
