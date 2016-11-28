require 'net/http'
require 'json'

def translate_status_to_class(status)
  statuses = {
      'success' => 'passed',
      'running' => 'pending',
      'failure' => 'failed'
  }
  statuses[status] || 'pending'
end

def get_latest_build_for_each_branch(json)
  json.group_by{|b| b['branch']}.map{|branch| branch[1].max_by{|build| build['started_at']}}
end

def get_drone_builds_for_repo(repo_name)
  uri = URI.parse('https://drone.digital.homeoffice.gov.uk/api/repos/UKHomeOffice/' + repo_name + '/builds')
  drone_results = Net::HTTP.get(uri)
  parsed_results = JSON.parse(drone_results)
  latest_builds_per_branch = get_latest_build_for_each_branch(parsed_results)

  latest_builds_per_branch.map{|b| {
      repo: repo_name,
      branch: b["branch"],
      widget_class: translate_status_to_class(b["status"]),
      avatar_url: b["author_avatar"]
  }}
end

def get_drone_builds_for_repos(repo_names)
  repo_names.flat_map{|repo_name| get_drone_builds_for_repo(repo_name)}
end
