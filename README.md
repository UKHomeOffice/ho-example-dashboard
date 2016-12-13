# HO Example Dashboard
This repo is here to provide a quick and easy way for teams to get running with a basic dashboard.
Over time it will be expanded with more features.

For a richer dashboarding experience we recommend forking this repo and customizing the dashboard to your heart's content.

The dashboard is built on Smashing - check out https://github.com/SmashingDashboard/smashing for more information.

## Deploying with kubernetes

### Whilst we are trialling the dashboards... 
You can deploy to the dev-induction namespace with the following command (setting your own params for the name of the dashboard and the repo names):
```
drone deploy -p DASHBOARD_NAME=my-dashboard -p GITHUB_REPOS=UKHomeOffice/repo1,UKHomeOffice/repo2 UKHomeOffice/ho-example-dashboard 29 dashboard
```
Note the number refers to the current build of the dashboard. Please increment this number to match later builds on drone if you would like to use a later version.

It will take a few minutes to deploy, at which point you'll be able to see your dashboard here (replacing my-dashboard with your dashboard name):
https://my-dashboard.notprod.homeoffice.gov.uk/example


### Long term deploy solution
You will need:

1. A namespace to deploy to
1. A step in your drone yaml to do the deploy (you can use the deploy step in this repos .drone.yml as a guide)
1. Drone secrets for KUBE_TOKEN to deploy to your chosen namespace
1. Secrets within that namespace for TLS encryption matching the name given in the ingress controller (external-tls)

### Customizing the dashboard
The above gives you a basic dashboard with some core capabilities. If you would like to customize it further please fork this repo and tinker to your heart's content!

### Future plans
The dashboard currently only supports public repos in Github. Functionality will be added for Gitlab - this is the next thing on the roadmap.

## Running the dashboard on your machine
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
