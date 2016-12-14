require 'json'
require_relative '../../lib/github_drone'
require_relative '../data/mock_drone_responses'
require_relative '../data/mock_github_responses'

RSpec.describe 'get_drone_builds' do
  it 'Gets all drone builds in the correct format for a single repo' do
    # Given the get request will return some mocked up data
    repo_name = 'UKHomeOffice/test-repo'
    stub_request(:get, CONFIG[:drone_github_server] + '/api/repos/' + repo_name + '/builds').
        to_return(:status => 200, :body => DRONE_DATA_REPO1)


    #   When I get call get_drone_builds
    result = get_drone_builds_for_repo(repo_name)


    #   Then I get the drone builds as expected
    expected_result = [
        {
            repo: 'UKHomeOffice/test-repo',
            branch: 'master',
            widget_class: 'failed',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        },
        {
            repo: 'UKHomeOffice/test-repo',
            branch: 'new-feature',
            widget_class: 'passed',
            avatar_url: 'www.avatars.com/mrssuper.jpg'
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

RSpec.describe 'get_drone_builds_for_repos' do
  it 'Gets all drone builds in the correct format for multiple repos' do
    # Given the get request will return some mocked up data
    repo1_name = 'UKHomeOffice/test-repo'
    repo2_name = 'UKHomeOffice/test-repo2'
    stub_request(:get, CONFIG[:drone_github_server] + '/api/repos/' + repo1_name + '/builds').
        to_return(:status => 200, :body => DRONE_DATA_REPO1)
    stub_request(:get, CONFIG[:drone_github_server] + '/api/repos/' + repo2_name + '/builds').
        to_return(:status => 200, :body => DRONE_DATA_REPO2)


    #   When I get call get_drone_builds
    result = get_drone_builds_for_repos([repo1_name, repo2_name])


    #   Then I get the drone builds as expected
    expected_data = [
        {
            repo: 'UKHomeOffice/test-repo',
            branch: 'master',
            widget_class: 'failed',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        },
        {
            repo: 'UKHomeOffice/test-repo',
            branch: 'new-feature',
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

    expect(result).to eq(expected_data)
  end
end

RSpec.describe 'get_latest_build_for_each_branch' do
  it 'filters to retrieve only the latest builds' do
    # Given a json payload
    input_data = JSON.parse(DRONE_DATA_REPO1)

    # When I call get_latest_build_for_each_branch
    result = get_latest_build_for_each_branch(input_data)

    # Then I get back only the latest builds for each branch
    expect(result).to eq(JSON.parse(FILTERED_DRONE_DATA_REPO1))
  end
end
