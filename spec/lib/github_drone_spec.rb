require 'json'
require_relative '../../lib/github_drone'
require_relative '../data/mock_drone_responses'
require_relative '../data/mock_github_responses'

RSpec.describe 'get_drone_builds_for_github_branches' do
  it 'Gets all drone builds for branches in Github in the correct format' do
  #   Given the get request to drone will return some mocked up data
    repo1_name = 'UKHomeOffice/test-repo'
    repo2_name = 'UKHomeOffice/test-repo2'
    stub_request(:get, CONFIG[:drone_github_server] + '/api/repos/' + repo1_name + '/builds').
        to_return(:status => 200, :body => DRONE_DATA_REPO1, :headers => {:content_type => 'application/json'})
    stub_request(:get, CONFIG[:drone_github_server] + '/api/repos/' + repo2_name + '/builds').
        to_return(:status => 200, :body => DRONE_DATA_REPO2, :headers => {:content_type => 'application/json'})
  #   And the get request to Github will return some mocked up data
    stub_request(:get, CONFIG[:github_server] + '/repos/' + repo1_name + '/branches').
        to_return(:status => 200, :body => GITHUB_BRANCHES1, :headers => {:content_type => 'application/json'})
    stub_request(:get, CONFIG[:github_server] + '/repos/' + repo2_name + '/branches').
        to_return(:status => 200, :body => '[]', :headers => {:content_type => 'application/json'})

  #   When I call get_drone_builds_for_github_branches
    result = get_drone_builds_also_in_github([repo1_name, repo2_name])

  #   Then the results include just those for branches in both Drone and Github
    expected_result = [
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
        }
    ]

    expect(result).to eq(expected_result)
  end
end
