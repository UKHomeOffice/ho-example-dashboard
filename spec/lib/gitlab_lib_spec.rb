require 'json'
require_relative '../../lib/gitlab_lib'
require_relative '../data/mock_gitlab_responses'
require_relative '../../config'

RSpec.describe 'get_gitlab_branches' do
  it 'Gets all the branches in Gitlab for a given repository' do
    repo_name1 = 'team1/test-repo'
    repo_name2 = 'team2/test-repo2'
    #   When the get request is sent to Gitlab will return some mocked up data
    stub_request(:get, CONFIG[:gitlab_server] + '/projects').
        to_return(:status => 200, :body => GITLAB_PROJECTS, :headers => {:content_type => 'application/json'})

    stub_request(:get, CONFIG[:gitlab_server] + '/projects/1/repository/branches').
        to_return(:status => 200, :body => GITLAB_BRANCHES1, :headers => {:content_type => 'application/json'})
    stub_request(:get, CONFIG[:gitlab_server] + '/projects/2/repository/branches').
        to_return(:status => 200, :body => GITLAB_BRANCHES2, :headers => {:content_type => 'application/json'})

    # And I call get_github_branches
    result = Gitlab_lib::Get_branches.call([repo_name1, repo_name2])

    # Then I expect the result to equal the list of branches
    expected_result = [{:repo => 'team1/test-repo', :branches => ['master', 'patch-bug']},
                       {:repo => 'team2/test-repo2', :branches => ['master', 'feature'] }]
    expect(result).to eq(expected_result)
  end

end
