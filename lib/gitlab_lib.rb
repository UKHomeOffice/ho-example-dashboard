require_relative '../config'
require 'gitlab_lib'
require 'gitlab'


class Gitlab_lib
  def initialize
    Gitlab.configure do |config|
      config.endpoint = CONFIG[:gitlab_server]
      config.private_token = CONFIG[:gitlab_token]
    end
  end

  def get_branches(repo_names)
    projects = Gitlab.projects.map { |project| project.to_hash }.select { |project| repo_names.include? project['path_with_namespace'] }
    projects_with_branches = projects.map do |project|
      branches = Gitlab.branches(project['id']).map { |branch| branch.to_hash['name'] }
      {:repo => project['path_with_namespace'], :branches => branches}
    end
    projects_with_branches
  end
end


Gl = Gitlab_lib.new