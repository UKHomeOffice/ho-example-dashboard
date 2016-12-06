require 'json'
require_relative '../../lib/github'
require_relative '../data/mock_github_responses'

RSpec.describe 'get_github_branches' do
  it 'Gets all the branches in Github for a given repository' do
    repo_name1 = 'UKHomeOffice/test-repo'
    repo_name2 = 'UKHomeOffice/test-repo2'
    #   When the get request to Github will return some mocked up data
    stub_request(:get, 'https://api.github.com/repos/' + repo_name1 + '/branches').
        to_return(:status => 200, :body => GITHUB_BRANCHES1, :headers => {:content_type => 'application/json'})
    stub_request(:get, 'https://api.github.com/repos/' + repo_name2 + '/branches').
        to_return(:status => 200, :body => GITHUB_BRANCHES2, :headers => {:content_type => 'application/json'})

    # And I call get_github_branches
    result = get_github_branches([repo_name1, repo_name2])

    # Then I expect the result to equal the list of branches
    expected_result = [{:repo => 'UKHomeOffice/test-repo', :branches => ['master', 'patch-bug']},
                       {:repo => 'UKHomeOffice/test-repo2', :branches => ['master', 'feature'] }]
    expect(result).to eq(expected_result)
  end
end
