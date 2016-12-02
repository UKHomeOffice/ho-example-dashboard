require 'json'
require_relative '../../lib/github'
require_relative '../data/mock_github_responses'

RSpec.describe 'get_github_branch_statuses' do
  it 'gets the statuses for all branches on the given repositories' do
    repo_name1 = 'UKHomeOffice/test-repo'
    repo_name2 = 'UKHomeOffice/test-repo2'
    #   When the get request to Github will return some mocked up data
    stub_request(:get, 'https://api.github.com/repos/' + repo_name1 + '/branches').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_BRANCHES1)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name2 + '/branches').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_BRANCHES2)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name1 + '/statuses/first').
      to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES1)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name1 + '/statuses/second').
      to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES2)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name2 + '/statuses/third').
      to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES3)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name2 + '/statuses/fourth').
      to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES4)

    # And I call get_github_branches
    result = get_github_branch_statuses([repo_name1, repo_name2])

    # Then I expect the result to equal the list of branches and their statuses
    expected_result = [
        {
            repo: 'test-repo',
            branch: 'master',
            widget_class: 'pending',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        },
        {
            repo: 'test-repo',
            branch: 'patch-bug',
            widget_class: 'failed',
            avatar_url: 'www.avatars.com/mrssuper.jpg'
        },
        {
            repo: 'test-repo2',
            branch: 'master',
            widget_class: 'passed',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        },
        {
            repo: 'test-repo2',
            branch: 'feature',
            widget_class: 'passed',
            avatar_url: 'www.avatars.com/mrssuper.jpg'
        },

    ]

    expect(result).to eq(expected_result)
  end

  it 'caches state of builds for particular commit hashes' do
    repo_name1 = 'UKHomeOffice/test-repo'
    repo_name2 = 'UKHomeOffice/test-repo2'
    #   When the get request to Github will return some mocked up data
    stub_request(:get, 'https://api.github.com/repos/' + repo_name1 + '/branches').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_BRANCHES1).times(2)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name2 + '/branches').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_BRANCHES2).times(2)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name1 + '/statuses/first').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES1).times(1)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name1 + '/statuses/second').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES2).times(1)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name2 + '/statuses/third').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES3).times(1)
    stub_request(:get, 'https://api.github.com/repos/' + repo_name2 + '/statuses/fourth').
        to_return(:status => 200, :headers => {:content_type => 'application/json'}, :body => GITHUB_STATUSES4).times(1)

    # And I call get_github_branches
    result = get_github_branch_statuses([repo_name1, repo_name2])

    # Then I expect the result to equal the list of branches and their statuses
    expected_result = [
        {
            repo: 'test-repo',
            branch: 'master',
            widget_class: 'pending',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        },
        {
            repo: 'test-repo',
            branch: 'patch-bug',
            widget_class: 'failed',
            avatar_url: 'www.avatars.com/mrssuper.jpg'
        },
        {
            repo: 'test-repo2',
            branch: 'master',
            widget_class: 'passed',
            avatar_url: 'www.avatars.com/mrsuper.jpg'
        },
        {
            repo: 'test-repo2',
            branch: 'feature',
            widget_class: 'passed',
            avatar_url: 'www.avatars.com/mrssuper.jpg'
        },

    ]

    expect(result).to eq(expected_result)

    assert_requested :get, 'https://api.github.com/repos/' + repo_name1 + '/branches', times: 2
    assert_requested :get, 'https://api.github.com/repos/' + repo_name2 + '/branches', times: 2
    assert_requested :get, 'https://api.github.com/repos/' + repo_name1 + '/statuses/first', times: 1
    assert_requested :get, 'https://api.github.com/repos/' + repo_name1 + '/statuses/second', times: 1
    assert_requested :get, 'https://api.github.com/repos/' + repo_name2 + '/statuses/third', times: 1
    assert_requested :get, 'https://api.github.com/repos/' + repo_name2 + '/statuses/fourth', times: 1
  end

  skip it 'Wipes the cache every 2 minutes' do
    expect(1).to eq(2)
  end
end