require_relative "../lib/drone"

SCHEDULER.every '10s', :first_in => 0  do
  send_event('build-statuses', { items: get_drone_builds_for_repos(['docker-node-hello-world']) })
end
