require 'octokit'
require_relative '../config'

module Github
  @gh = Octokit::Client.new({:access_token => CONFIG[:github_token]})

  def Github.get_branches(repo_names)
    repo_names.flat_map do |repo_name|
      branches = @gh.branches(repo_name)
      {:repo => repo_name, :branches => branches.map { |branch| branch[:name] }}
    end
  end

  Get_branches = method(:get_branches)
end
