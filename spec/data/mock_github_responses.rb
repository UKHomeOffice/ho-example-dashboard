GITHUB_BRANCHES1 = '
[{
	"name": "master",
	"commit": {
		"sha": "first",
		"url": "https://api.github.com/repos/UKHomeOffice/test-repo/commits/first"
	}
}, {
	"name": "patch-bug",
	"commit": {
		"sha": "second",
		"url": "https://api.github.com/repos/UKHomeOffice/test-repo/commits/second"
	}
}]
'

GITHUB_BRANCHES2 = '
[{
	"name": "master",
	"commit": {
		"sha": "third",
		"url": "https://api.github.com/repos/UKHomeOffice/test-repo2/commits/third"
	}
}, {
	"name": "feature",
	"commit": {
		"sha": "fourth",
		"url": "https://api.github.com/repos/UKHomeOffice/test-repo2/commits/fourth"
	}
}]
'

GITHUB_STATUSES1 = '
[{
	"url": "https://api.github.com/repos/UKHomeOffice/test-repo/statuses/first",
	"id": 884408555,
	"state": "pending",
	"description": "the build was successful",
	"target_url": "https://drone-external.digital.homeoffice.gov.uk/UKHomeOffice/test-repo/59",
	"context": "continuous-integration/drone/push",
	"created_at": "2016-11-30T14:03:55Z",
	"updated_at": "2016-11-30T14:03:55Z",
	"creator": {
		"login": "atodd-hod",
		"id": 19405035,
		"avatar_url": "www.avatars.com/mrsuper.jpg",
		"gravatar_id": "",
		"url": "https://api.github.com/users/atodd-hod",
		"html_url": "https://github.com/atodd-hod",
		"followers_url": "https://api.github.com/users/atodd-hod/followers",
		"following_url": "https://api.github.com/users/atodd-hod/following{/other_user}",
		"gists_url": "https://api.github.com/users/atodd-hod/gists{/gist_id}",
		"starred_url": "https://api.github.com/users/atodd-hod/starred{/owner}{/repo}",
		"subscriptions_url": "https://api.github.com/users/atodd-hod/subscriptions",
		"organizations_url": "https://api.github.com/users/atodd-hod/orgs",
		"repos_url": "https://api.github.com/users/atodd-hod/repos",
		"events_url": "https://api.github.com/users/atodd-hod/events{/privacy}",
		"received_events_url": "https://api.github.com/users/atodd-hod/received_events",
		"type": "User",
		"site_admin": false
	}
}, {
	"url": "https://api.github.com/repos/UKHomeOffice/test-repo/statuses/first",
	"id": 884389504,
	"state": "pending",
	"description": "this build is pending",
	"target_url": "https://drone-external.digital.homeoffice.gov.uk/UKHomeOffice/test-repo/59",
	"context": "continuous-integration/drone/push",
	"created_at": "2016-11-30T13:54:37Z",
	"updated_at": "2016-11-30T13:54:37Z",
	"creator": {
		"login": "atodd-hod",
		"id": 19405035,
		"avatar_url": "www.avatars.com/mrsuper.jpg",
		"gravatar_id": "",
		"url": "https://api.github.com/users/atodd-hod",
		"html_url": "https://github.com/atodd-hod",
		"followers_url": "https://api.github.com/users/atodd-hod/followers",
		"following_url": "https://api.github.com/users/atodd-hod/following{/other_user}",
		"gists_url": "https://api.github.com/users/atodd-hod/gists{/gist_id}",
		"starred_url": "https://api.github.com/users/atodd-hod/starred{/owner}{/repo}",
		"subscriptions_url": "https://api.github.com/users/atodd-hod/subscriptions",
		"organizations_url": "https://api.github.com/users/atodd-hod/orgs",
		"repos_url": "https://api.github.com/users/atodd-hod/repos",
		"events_url": "https://api.github.com/users/atodd-hod/events{/privacy}",
		"received_events_url": "https://api.github.com/users/atodd-hod/received_events",
		"type": "User",
		"site_admin": false
	}
}]
'

GITHUB_STATUSES2 = '
[{
	"url": "https://api.github.com/repos/UKHomeOffice/test-repo/statuses/second",
	"id": 884408555,
	"state": "failure",
	"description": "the build was successful",
	"target_url": "https://drone-external.digital.homeoffice.gov.uk/UKHomeOffice/test-repo/59",
	"context": "continuous-integration/drone/push",
	"created_at": "2016-11-30T14:03:55Z",
	"updated_at": "2016-11-30T14:03:55Z",
	"creator": {
		"login": "atodd-hod",
		"id": 19405035,
		"avatar_url": "www.avatars.com/mrssuper.jpg",
		"gravatar_id": "",
		"url": "https://api.github.com/users/atodd-hod",
		"html_url": "https://github.com/atodd-hod",
		"followers_url": "https://api.github.com/users/atodd-hod/followers",
		"following_url": "https://api.github.com/users/atodd-hod/following{/other_user}",
		"gists_url": "https://api.github.com/users/atodd-hod/gists{/gist_id}",
		"starred_url": "https://api.github.com/users/atodd-hod/starred{/owner}{/repo}",
		"subscriptions_url": "https://api.github.com/users/atodd-hod/subscriptions",
		"organizations_url": "https://api.github.com/users/atodd-hod/orgs",
		"repos_url": "https://api.github.com/users/atodd-hod/repos",
		"events_url": "https://api.github.com/users/atodd-hod/events{/privacy}",
		"received_events_url": "https://api.github.com/users/atodd-hod/received_events",
		"type": "User",
		"site_admin": false
	}
}, {
	"url": "https://api.github.com/repos/UKHomeOffice/test-repo/statuses/second",
	"id": 884389504,
	"state": "pending",
	"description": "this build is pending",
	"target_url": "https://drone-external.digital.homeoffice.gov.uk/UKHomeOffice/test-repo/59",
	"context": "continuous-integration/drone/push",
	"created_at": "2016-11-30T13:54:37Z",
	"updated_at": "2016-11-30T13:54:37Z",
	"creator": {
		"login": "atodd-hod",
		"id": 19405035,
		"avatar_url": "www.avatars.com/mrssuper.jpg",
		"gravatar_id": "",
		"url": "https://api.github.com/users/atodd-hod",
		"html_url": "https://github.com/atodd-hod",
		"followers_url": "https://api.github.com/users/atodd-hod/followers",
		"following_url": "https://api.github.com/users/atodd-hod/following{/other_user}",
		"gists_url": "https://api.github.com/users/atodd-hod/gists{/gist_id}",
		"starred_url": "https://api.github.com/users/atodd-hod/starred{/owner}{/repo}",
		"subscriptions_url": "https://api.github.com/users/atodd-hod/subscriptions",
		"organizations_url": "https://api.github.com/users/atodd-hod/orgs",
		"repos_url": "https://api.github.com/users/atodd-hod/repos",
		"events_url": "https://api.github.com/users/atodd-hod/events{/privacy}",
		"received_events_url": "https://api.github.com/users/atodd-hod/received_events",
		"type": "User",
		"site_admin": false
	}
}]
'

GITHUB_STATUSES3 = '
[{
	"url": "https://api.github.com/repos/UKHomeOffice/test-repo2/statuses/third",
	"id": 884408559,
	"state": "success",
	"description": "the build was successful",
	"target_url": "https://drone-external.digital.homeoffice.gov.uk/UKHomeOffice/test-repo2/59",
	"context": "continuous-integration/drone/push",
	"created_at": "2016-11-30T14:03:55Z",
	"updated_at": "2016-11-30T14:03:55Z",
	"creator": {
		"login": "atodd-hod",
		"id": 19405035,
		"avatar_url": "www.avatars.com/mrsuper.jpg",
		"gravatar_id": "",
		"url": "https://api.github.com/users/atodd-hod",
		"html_url": "https://github.com/atodd-hod",
		"followers_url": "https://api.github.com/users/atodd-hod/followers",
		"following_url": "https://api.github.com/users/atodd-hod/following{/other_user}",
		"gists_url": "https://api.github.com/users/atodd-hod/gists{/gist_id}",
		"starred_url": "https://api.github.com/users/atodd-hod/starred{/owner}{/repo}",
		"subscriptions_url": "https://api.github.com/users/atodd-hod/subscriptions",
		"organizations_url": "https://api.github.com/users/atodd-hod/orgs",
		"repos_url": "https://api.github.com/users/atodd-hod/repos",
		"events_url": "https://api.github.com/users/atodd-hod/events{/privacy}",
		"received_events_url": "https://api.github.com/users/atodd-hod/received_events",
		"type": "User",
		"site_admin": false
	}
}]
'

GITHUB_STATUSES4 = '
[{
	"url": "https://api.github.com/repos/UKHomeOffice/test-repo2/statuses/fourth",
	"id": 884408555,
	"state": "success",
	"description": "the build was successful",
	"target_url": "https://drone-external.digital.homeoffice.gov.uk/UKHomeOffice/test-repo2/59",
	"context": "continuous-integration/drone/push",
	"created_at": "2016-11-30T14:03:55Z",
	"updated_at": "2016-11-30T14:03:55Z",
	"creator": {
		"login": "atodd-hod",
		"id": 19405035,
		"avatar_url": "www.avatars.com/mrssuper.jpg",
		"gravatar_id": "",
		"url": "https://api.github.com/users/atodd-hod",
		"html_url": "https://github.com/atodd-hod",
		"followers_url": "https://api.github.com/users/atodd-hod/followers",
		"following_url": "https://api.github.com/users/atodd-hod/following{/other_user}",
		"gists_url": "https://api.github.com/users/atodd-hod/gists{/gist_id}",
		"starred_url": "https://api.github.com/users/atodd-hod/starred{/owner}{/repo}",
		"subscriptions_url": "https://api.github.com/users/atodd-hod/subscriptions",
		"organizations_url": "https://api.github.com/users/atodd-hod/orgs",
		"repos_url": "https://api.github.com/users/atodd-hod/repos",
		"events_url": "https://api.github.com/users/atodd-hod/events{/privacy}",
		"received_events_url": "https://api.github.com/users/atodd-hod/received_events",
		"type": "User",
		"site_admin": false
	}
}, {
	"url": "https://api.github.com/repos/UKHomeOffice/test-repo/statuses/fourth",
	"id": 884389504,
	"state": "pending",
	"description": "this build is pending",
	"target_url": "https://drone-external.digital.homeoffice.gov.uk/UKHomeOffice/test-repo2/59",
	"context": "continuous-integration/drone/push",
	"created_at": "2016-11-30T13:54:37Z",
	"updated_at": "2016-11-30T13:54:37Z",
	"creator": {
		"login": "atodd-hod",
		"id": 19405035,
		"avatar_url": "www.avatars.com/mrssuper.jpg",
		"gravatar_id": "",
		"url": "https://api.github.com/users/atodd-hod",
		"html_url": "https://github.com/atodd-hod",
		"followers_url": "https://api.github.com/users/atodd-hod/followers",
		"following_url": "https://api.github.com/users/atodd-hod/following{/other_user}",
		"gists_url": "https://api.github.com/users/atodd-hod/gists{/gist_id}",
		"starred_url": "https://api.github.com/users/atodd-hod/starred{/owner}{/repo}",
		"subscriptions_url": "https://api.github.com/users/atodd-hod/subscriptions",
		"organizations_url": "https://api.github.com/users/atodd-hod/orgs",
		"repos_url": "https://api.github.com/users/atodd-hod/repos",
		"events_url": "https://api.github.com/users/atodd-hod/events{/privacy}",
		"received_events_url": "https://api.github.com/users/atodd-hod/received_events",
		"type": "User",
		"site_admin": false
	}
}]
'