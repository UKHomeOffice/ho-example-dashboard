CONFIG = {
    :github_repos => ENV["GITHUB_REPOS"].split(",") || ["UKHomeOffice/docker-node-hello-world"],
    :github_login => ENV["GITHUB_USERNAME"],
    :github_password => ENV["GITHUB_PASSWORD"]
}