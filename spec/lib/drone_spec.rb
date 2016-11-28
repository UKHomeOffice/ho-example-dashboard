require 'json'
require_relative "../../lib/drone"
require_relative "../data/test_data"

RSpec.describe "get_drone_builds" do
  it "Gets all drone builds in the correct format" do
    # Given the get request will return some mocked up data
    repo_name = "test-repo"
    stub_request(:get, "https://drone.digital.homeoffice.gov.uk/api/repos/UKHomeOffice/" + repo_name + "/builds").
        to_return(:status => 200, :body => TEST_DATA_TEST_REPO)


    #   When I get call get_drone_builds
    result = get_drone_builds_for_repo(repo_name)


    #   Then I get the drone builds as expected
    expected_data = [
        {
            repo: "test-repo",
            branch: "master",
            widget_class: "failed",
            avatar_url: "www.avatars.com/mrsuper.jpg"
        },
        {
            repo: "test-repo",
            branch: "new-feature",
            widget_class: "passed",
            avatar_url: "www.avatars.com/mrssuper.jpg"
        },
        {
            repo: "test-repo",
            branch: "patch-bug",
            widget_class: "pending",
            avatar_url: "www.avatars.com/mrssuper.jpg"
        }
    ]

    expect(result).to eq(expected_data)
  end
end

RSpec.describe "get_drone_builds" do
  it "Gets all drone builds in the correct format" do
    # Given the get request will return some mocked up data
    repo1_name = "test-repo"
    repo2_name = "test-repo2"
    stub_request(:get, "https://drone.digital.homeoffice.gov.uk/api/repos/UKHomeOffice/" + repo1_name + "/builds").
        to_return(:status => 200, :body => TEST_DATA_TEST_REPO)
    stub_request(:get, "https://drone.digital.homeoffice.gov.uk/api/repos/UKHomeOffice/" + repo2_name + "/builds").
        to_return(:status => 200, :body => TEST_DATA_TEST_REPO2)


    #   When I get call get_drone_builds
    result = get_drone_builds_for_repos([repo1_name, repo2_name])


    #   Then I get the drone builds as expected
    expected_data = [
        {
            repo: "test-repo",
            branch: "master",
            widget_class: "failed",
            avatar_url: "www.avatars.com/mrsuper.jpg"
        },
        {
            repo: "test-repo",
            branch: "new-feature",
            widget_class: "passed",
            avatar_url: "www.avatars.com/mrssuper.jpg"
        },
        {
            repo: "test-repo",
            branch: "patch-bug",
            widget_class: "pending",
            avatar_url: "www.avatars.com/mrssuper.jpg"
        },
        {
            repo: "test-repo2",
            branch: "master",
            widget_class: "passed",
            avatar_url: "www.avatars.com/mrsuper.jpg"
        }
    ]

    expect(result).to eq(expected_data)
  end
end

RSpec.describe "get_latest_build_for_each_branch" do
  it "filters to retrieve only the latest builds" do
    # Given a json payload
    input_data = JSON.parse(TEST_DATA_TEST_REPO)

    # When I call get_latest_build_for_each_branch
    result = get_latest_build_for_each_branch(input_data)

    # Then I get back only the latest builds for each branch
    expect(result).to eq(JSON.parse(FILTERED_TEST_DATA_TEST_REPO))
  end
end
