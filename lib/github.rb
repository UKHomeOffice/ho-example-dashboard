require 'httparty'

def get_github_branches(repo_names)
  repo_names.map do |repo_name|
    response = HTTParty.get('https://api.github.com/repos/UKHomeOffice/' + repo_name + '/branches')
    if response.code != 200
      puts 'Error connecting to Github'
    end
    parsed_results = JSON.parse(response.body)
    { :repo => repo_name, :branches => parsed_results.map { |branch| branch['name']} }
  end
end