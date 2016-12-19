require 'json'
require_relative '../../lib/active_builds'
require_relative '../data/mock_drone_responses'
require_relative '../data/mock_github_responses'

RSpec.describe 'get_builds_for_active_branches' do
  it 'Gets all the recent builds and all the active branches and filters the build to only show those for the active branches' do
  #   Given I have functions which return a list of recent builds and active branches
    repo1_name = 'UKHomeOffice/test-repo'
    repo2_name = 'UKHomeOffice/test-repo2'
    repo_names = [repo1_name, repo2_name]
    def mock_get_builds(repo_names, drone_server, token)
      [
          {
              repo: 'UKHomeOffice/test-repo',
              branch: 'master',
              widget_class: 'failed',
              avatar_url: 'www.avatars.com/mrsuper.jpg'
          },
          {
              repo: 'UKHomeOffice/test-repo',
              branch: 'feature',
              widget_class: 'passed',
              avatar_url: 'www.avatars.com/mrssuper.jpg'
          },
          {
              repo: 'UKHomeOffice/test-repo',
              branch: 'patch-bug',
              widget_class: 'pending',
              avatar_url: 'www.avatars.com/mrssuper.jpg'
          },
          {
              repo: 'UKHomeOffice/test-repo2',
              branch: 'master',
              widget_class: 'passed',
              avatar_url: 'www.avatars.com/mrsuper.jpg'
          }
      ]
    end

    def mock_get_active_branches(repo_names)
      [{:repo => 'UKHomeOffice/test-repo', :branches => ['master', 'patch-bug']},{:repo => 'UKHomeOffice/test-repo2', :branches => ['master', 'feature'] }]
    end

  #   And I call get_builds_for_active_branches
    results = Active_builds.get_builds(repo_names, CONFIG[:drone_github_server], CONFIG[:drone_gitlab_token],
                                       method(:mock_get_builds), method(:mock_get_active_branches))

  #   Then I expect to return the builds for just active branches returned
    expected_results = [
        {
            repo: 'UKHomeOffice/test-repo',
            branch: 'master',
            widget_class: 'failed',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        },
        {
            repo: 'UKHomeOffice/test-repo',
            branch: 'patch-bug',
            widget_class: 'pending',
            avatar_url: 'www.avatars.com/mrssuper.jpg'
        },
        {
            repo: 'UKHomeOffice/test-repo2',
            branch: 'master',
            widget_class: 'passed',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        }
    ]

    expect(results).to eq(expected_results)
  end
end