CONFIG = {
    :github_repos => (ENV['GITHUB_REPOS'] || 'UKHomeOffice/docker-node-hello-world').split(','),
    :github_login => ENV['GITHUB_USERNAME'],
    :github_password => ENV['GITHUB_PASSWORD'],
    :drone_github_server => ENV['DRONE_GH_SERVER'],
    :github_server => ENV['GITHUB_SERVER'] || 'https://api.github.com'
}