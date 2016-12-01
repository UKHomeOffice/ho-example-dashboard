require_relative "../lib/github"
require_relative "../config.rb"

SCHEDULER.every '10s', :first_in => 0  do
  send_event('build-statuses', { items: get_github_branch_statuses(CONFIG[:github_repos]) })
end
