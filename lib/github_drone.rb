require_relative './github'
require_relative './drone'

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
