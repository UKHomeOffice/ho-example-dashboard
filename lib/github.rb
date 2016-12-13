require 'octokit'
require_relative '../config'

def get_github_branches(repo_names)
  gh = Octokit::Client.new({:login => CONFIG[:github_login], :password => CONFIG[:github_password]})
  repo_names.flat_map do |repo_name|
    branches = gh.branches(repo_name)
    { :repo => repo_name, :branches => branches.map{|branch| branch[:name]} }
  end
end
