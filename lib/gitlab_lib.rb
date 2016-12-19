require_relative '../config'
require 'gitlab'

module Gitlab_lib
  Gitlab.configure do |config|
    config.endpoint = CONFIG[:gitlab_server]
    config.private_token = CONFIG[:gitlab_token]
  end

  def Gitlab_lib.get_branches(repo_names)
    projects = Gitlab.projects.map { |project| project.to_hash }.select { |project| repo_names.include? project['path_with_namespace'] }
    projects_with_branches = projects.map do |project|
      branches = Gitlab.branches(project['id']).map { |branch| branch.to_hash['name'] }
      {:repo => project['path_with_namespace'], :branches => branches}
    end
    projects_with_branches
  end

  Get_branches = method(:get_branches)
end
