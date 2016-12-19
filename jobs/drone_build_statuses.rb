require_relative '../lib/active_builds'
require_relative '../lib/github_lib'
require_relative '../lib/drone'
require_relative '../config.rb'

SCHEDULER.every '10s', :first_in => 0 do
  all_builds = []
  if CONFIG[:github_repos]
    github_builds = Active_builds.get_builds(CONFIG[:github_repos], CONFIG[:drone_github_server], '',
                                             Drone::Get_drone_builds_for_repos, Github::Get_branches)
    all_builds += github_builds
  end

  if CONFIG[:gitlab_repos]
    gitlab_builds = Active_builds.get_builds(CONFIG[:gitlab_repos], CONFIG[:drone_gitlab_server], CONFIG[:drone_gitlab_token],
                                             Drone::Get_drone_builds_for_repos, Gitlab_lib::Get_branches)
    all_builds += gitlab_builds
  end
  send_event('build-statuses', {items: all_builds})
end
