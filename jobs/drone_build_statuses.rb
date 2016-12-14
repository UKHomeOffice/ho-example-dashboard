require_relative "../lib/github_drone"
require_relative "../config.rb"

SCHEDULER.every '10s', :first_in => 0  do
  send_event('build-statuses', { items: get_drone_builds_also_in_github(CONFIG[:github_repos]) })
end
