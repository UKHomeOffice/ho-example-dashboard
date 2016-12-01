require 'httparty'
require 'octokit'
require_relative '../config'

def get_github_branch_statuses(repo_names)
  gh = Octokit::Client.new({:login => CONFIG[:github_login], :password => CONFIG[:github_password]})
  puts "REPO NAMES"
  puts repo_names
  repo_names.flat_map do |repo_name|
    branches = gh.branches(repo_name)

    puts "BRANCHES"
    puts branches.map{|branch| branch[:name]}

    branches.map do |branch|
      latest_status = gh.statuses(repo_name, branch[:commit][:sha]).
          select { |status| status[:context].start_with?('continuous-integration/drone') }.
          max_by { |status| status[:updated_at] }

      widget_class = if latest_status == nil then 'notrun' else translate_status_to_class(latest_status[:state]) end
      avatar_url = if latest_status == nil then '' else latest_status[:creator][:avatar_url] end

      puts "INDIVIDUAL BRANCH:"
      puts branch[:name]

      {
          repo: stripOrgFromRepoName(repo_name),
          branch: branch[:name],
          widget_class: widget_class,
          avatar_url: avatar_url
      }
    end
  end
end

def stripOrgFromRepoName(full_repo_name)
  full_repo_name.slice(full_repo_name.index('/')+1..-1)
end

def translate_status_to_class(status)
  statuses = {
      'success' => 'passed',
      'pending' => 'pending',
      'failure' => 'failed'
  }
  statuses[status] || 'pending'
end
