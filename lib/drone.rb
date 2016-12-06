require 'json'
require 'httparty'
require_relative './github'

def get_drone_builds_also_in_github(repo_names)
  github_branches_all_repos = get_github_branches(repo_names)
  drone_builds = get_drone_builds_for_repos(repo_names)
  drone_builds_also_in_github = drone_builds.select do |build|
    github_branches_all_repos.any? do |gh_branches_one_repo|
      gh_branches_one_repo[:repo] == build[:repo] && gh_branches_one_repo[:branches].include?(build[:branch])
    end
  end
  drone_builds_also_in_github
end

def translate_status_to_class(status)
  statuses = {
      'success' => 'passed',
      'running' => 'pending',
      'failure' => 'failed'
  }
  statuses[status] || 'pending'
end

def get_latest_build_for_each_branch(json)
  json.group_by { |b| b['branch'] }.map { |branch| branch[1].max_by { |build| build['started_at'] } }
end

def get_drone_builds_for_repo(repo_name)
  response = HTTParty.get('https://drone.digital.homeoffice.gov.uk/api/repos/' + repo_name + '/builds')
  parsed_results = JSON.parse(response.body)
  latest_builds_per_branch = get_latest_build_for_each_branch(parsed_results)

  latest_builds_per_branch.map { |b| {
      repo: repo_name,
      branch: b["branch"],
      widget_class: translate_status_to_class(b["status"]),
      avatar_url: b["author_avatar"]
  } }
end

def get_drone_builds_for_repos(repo_names)
  repo_names.flat_map { |repo_name| get_drone_builds_for_repo(repo_name) }
end
