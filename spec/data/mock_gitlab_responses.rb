GITLAB_PROJECTS = '
[{
	"id": 1,
	"description": "",
	"default_branch": "master",
	"tag_list": [],
	"public": false,
	"archived": false,
	"visibility_level": 0,
	"ssh_url_to_repo": "",
	"http_url_to_repo": "",
	"web_url": "",
	"name": "test-repo",
	"name_with_namespace": "team1 / test-repo",
	"path": "stacks-hod-platform",
	"path_with_namespace": "team1/test-repo",
	"container_registry_enabled": true,
	"issues_enabled": true,
	"merge_requests_enabled": true,
	"wiki_enabled": true,
	"builds_enabled": true,
	"snippets_enabled": false,
	"created_at": "2016-12-08T18:00:36.000Z",
	"last_activity_at": "2016-12-08T18:00:36.000Z",
	"shared_runners_enabled": false,
	"lfs_enabled": true,
	"creator_id": 265,
	"namespace": {
		"id": 131,
		"name": "team1",
		"path": "team1",
		"owner_id": null,
		"created_at": "2015-12-17T09:55:01.000Z",
		"updated_at": "2016-02-01T18:37:08.000Z",
		"description": "The team1 team!!",
		"avatar": {
			"url": "/uploads/group/avatar/131/team1pic.jpg"
		},
		"share_with_group_lock": false,
		"visibility_level": 20,
		"request_access_enabled": true,
		"deleted_at": null,
		"lfs_enabled": null
	},
	"avatar_url": null,
	"star_count": 0,
	"forks_count": 0,
	"open_issues_count": 0,
	"public_builds": true,
	"shared_with_groups": [],
	"only_allow_merge_if_build_succeeds": false,
	"request_access_enabled": true,
	"permissions": {
		"project_access": null,
		"group_access": {
			"access_level": 30,
			"notification_level": 3
		}
	}
},
{
	"id": 2,
	"description": "",
	"default_branch": "master",
	"tag_list": [],
	"public": false,
	"archived": false,
	"visibility_level": 0,
	"ssh_url_to_repo": "",
	"http_url_to_repo": "",
	"web_url": "",
	"name": "test-repo2",
	"name_with_namespace": "team2 / test-repo2",
	"path": "stacks-hod-platform",
	"path_with_namespace": "team2/test-repo2",
	"container_registry_enabled": true,
	"issues_enabled": true,
	"merge_requests_enabled": true,
	"wiki_enabled": true,
	"builds_enabled": true,
	"snippets_enabled": false,
	"created_at": "2016-12-08T18:00:36.000Z",
	"last_activity_at": "2016-12-08T18:00:36.000Z",
	"shared_runners_enabled": false,
	"lfs_enabled": true,
	"creator_id": 265,
	"namespace": {
		"id": 131,
		"name": "team2",
		"path": "team2",
		"owner_id": null,
		"created_at": "2015-12-17T09:55:01.000Z",
		"updated_at": "2016-02-01T18:37:08.000Z",
		"description": "The team2 team!!",
		"avatar": {
			"url": "/uploads/group/avatar/131/team2pic.jpg"
		},
		"share_with_group_lock": false,
		"visibility_level": 20,
		"request_access_enabled": true,
		"deleted_at": null,
		"lfs_enabled": null
	},
	"avatar_url": null,
	"star_count": 0,
	"forks_count": 0,
	"open_issues_count": 0,
	"public_builds": true,
	"shared_with_groups": [],
	"only_allow_merge_if_build_succeeds": false,
	"request_access_enabled": true,
	"permissions": {
		"project_access": null,
		"group_access": {
			"access_level": 30,
			"notification_level": 3
		}
	}
}]
'

GITLAB_BRANCHES1 = '
[{
	"name": "master",
	"commit": {
		"id": "1",
		"message": "committed stuff",
		"parent_ids": ["a", "b"],
		"authored_date": "2016-12-08T15:49:29.000+00:00",
		"author_name": "Mr Gitlab",
		"author_email": "mrgitlab@gitlab.com",
		"committed_date": "2016-12-08T15:49:29.000+00:00",
		"committer_name": "Mr Gitlab",
		"committer_email": "mrgitlab@gitlab.com"
	},
	"protected": true,
	"developers_can_push": false,
	"developers_can_merge": false
},
{
	"name": "patch-bug",
	"commit": {
		"id": "1",
		"message": "committed stuff",
		"parent_ids": ["a", "b"],
		"authored_date": "2016-12-08T15:49:29.000+00:00",
		"author_name": "Mr Gitlab",
		"author_email": "mrgitlab@gitlab.com",
		"committed_date": "2016-12-08T15:49:29.000+00:00",
		"committer_name": "Mr Gitlab",
		"committer_email": "mrgitlab@gitlab.com"
	},
	"protected": true,
	"developers_can_push": false,
	"developers_can_merge": false
}]
'

GITLAB_BRANCHES2 = '
[{
    "name": "master",
    "commit": {
    "id": "3",
    "message": "committed stuff",
    "parent_ids": ["c", "d"],
    "authored_date": "2016-12-08T15:49:29.000+00:00",
    "author_name": "Mrs Gitlab",
    "author_email": "mrsgitlab@gitlab.com",
    "committed_date": "2016-12-08T15:49:29.000+00:00",
    "committer_name": "Mrs Gitlab",
    "committer_email": "mrsgitlab@gitlab.com"
  },
  "protected": true,
  "developers_can_push": false,
  "developers_can_merge": false
},
{
    "name": "feature",
    "commit": {
    "id": "4",
    "message": "committed stuff",
    "parent_ids": ["c", "d"],
    "authored_date": "2016-12-08T15:49:29.000+00:00",
    "author_name": "Mrs Gitlab",
    "author_email": "mrsgitlab@gitlab.com",
    "committed_date": "2016-12-08T15:49:29.000+00:00",
    "committer_name": "Mrs Gitlab",
    "committer_email": "mrsgitlab@gitlab.com"
  },
  "protected": true,
  "developers_can_push": false,
  "developers_can_merge": false
}]
'