require_relative './github_lib'
require_relative './drone'

module Active_builds
  def Active_builds.get_builds(repo_names, builds_server, builds_server_token, fn_get_builds, fn_get_active_branches)
    branches_all_repos = fn_get_active_branches.call(repo_names)
    builds = fn_get_builds.call(repo_names, builds_server, builds_server_token)
    builds_with_active_branches = builds.select do |build|
      branches_all_repos.any? do |branches_one_repo|
        branches_one_repo[:repo] == build[:repo] && branches_one_repo[:branches].include?(build[:branch])
      end
    end
    builds_with_active_branches
  end
end
