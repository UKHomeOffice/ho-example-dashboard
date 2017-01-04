# HO Example Dashboard
This repo is here to provide a quick and easy way for teams to get running with a basic dashboard.
Over time it will be expanded with more features.

For a richer dashboarding experience we recommend forking this repo and customizing the dashboard to your heart's content.

The dashboard is built on Smashing - check out https://github.com/SmashingDashboard/smashing for more information.

## Configuration settings
All config is taken in with environment variables, you can set the following parameters:
**For dashboarding Github repo statuses**
- GITHUB_REPOS - comma separated list of Github repos
- GITHUB_TOKEN (whilst not required for open source repos it increases the rate limit dramatically so highly recommend setting this)
- DRONE_GH_SERVER - Drone server used for Github CI
- GITHUB_SERVER (defaults to https://api.github.com)

**For dashboarding Gitlab repo statuses**
- GITLAB_REPOS - command separated list of Gitlab repos in format TeamName/RepoName
- DRONE_GL_SERVER
- DRONE_GL_TOKEN
- GITLAB_SERVER
- GITLAB_TOKEN

## Managing tokens for Gitlab and Gitlab Drone
You will need to request an O365 dashboard account to be created by [contacting the Home Team](https://github.com/UKHomeOffice/central-devteam-board/wiki#office-365-accounts)
and requesting a dashboard account. **It's important you specify that it is a dashboard account** 

These will then need to be granted **read only** access to the relevant repos, and API tokens for Drone and Gitlab created for them.

## Deploying with kubernetes

**IMPORTANT NOTE - if dashboarding private projects please ensure the project names and branch names aren't sensitive.
There currently isn't any auth on the dashboards with the following deployments**

### Long term deploy solution
You will need:

1. A namespace to deploy to
1. A step in your drone yaml to do the deploy (you can use the deploy step in this repos [.drone.yml](.drone.yml) as a 
guide, and the files in [kubernetes_deployment](kubernetes_deployment))
1. Drone secrets for KUBE_TOKEN to deploy to your chosen namespace
1. Secrets within that namespace for TLS encryption matching the name given in the ingress controller (external-tls)

### Customizing the dashboard
The above gives you a basic dashboard with some core capabilities. If you would like to customize it further please fork this repo and tinker to your heart's content!
Let us know in [the issue here](https://github.com/UKHomeOffice/ho-example-dashboard/issues/9) if you do this please :)

## Running the dashboard on your machine
You can run the dashboard locally or with docker. Passing in environment variables lets you specify github credentials 
and the repos you wish to monitor. If you don't specify github credentials it will still work with public repos, 
but the rate limit will be lower.

**Note your local machine must have access to drone for this to work!**

### Running the dashboard with docker
```
git clone https://github.com/UKHomeOffice/ho-example-dashboard.git
cd ho-example-dashboard
docker build -t my-dashboard . 
docker run -ti -p 3030:3030 -e GITHUB_REPOS=UKHomeOffice/my-project-1,UKHomeOffice/my-project2 -e GITHUB_TOKEN=mypassword my-dashboard
```
You will find the dashboard on http://localhost:3030

### Running the dashboard locally
```
git clone https://github.com/UKHomeOffice/ho-example-dashboard.git
cd ho-example-dashboard
bundle install
GITHUB_REPOS=UKHomeOffice/my-project-1,UKHomeOffice/my-project2 GITHUB_TOKEN=mypassword smashing start
```
You will find the dashboard on http://localhost:3030

## Running tests
Tests are written with rspec, to run them do:
```
cd ho-example-dashboard
rspec
```
