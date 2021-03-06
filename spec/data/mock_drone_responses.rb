DRONE_DATA_REPO2 = '
[{
	"id": 12,
	"number": 12,
	"parent": 0,
	"event": "push",
	"status": "success",
	"enqueued_at": 1,
	"created_at": 1,
	"started_at": 1,
	"finished_at": 1,
	"deploy_to": "",
	"commit": "abc",
	"branch": "master",
	"ref": "refs/heads/master",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo2.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mr super",
	"author_avatar": "www.avatars.com/mrsuper.jpg",
	"author_email": "mrsuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo2/commit/abc",
	"signed": true,
	"verified": true
}]
'

DRONE_DATA_REPO1 = '
[{
	"id": 3469,
	"number": 3469,
	"parent": 0,
	"event": "push",
	"status": "success",
	"enqueued_at": 1,
	"created_at": 1,
	"started_at": 1,
	"finished_at": 1,
	"deploy_to": "",
	"commit": "abc",
	"branch": "master",
	"ref": "refs/heads/master",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mr super",
	"author_avatar": "www.avatars.com/mrsuper.jpg",
	"author_email": "mrsuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo/commit/abc",
	"signed": true,
	"verified": true
},
{
	"id": 3470,
	"number": 3470,
	"parent": 0,
	"event": "push",
	"status": "failure",
	"enqueued_at": 2,
	"created_at": 2,
	"started_at": 2,
	"finished_at": 2,
	"deploy_to": "",
	"commit": "def",
	"branch": "master",
	"ref": "refs/heads/master",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mr super",
	"author_avatar": "www.avatars.com/mrsuper.jpg",
	"author_email": "mrsuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo/commit/abc",
	"signed": true,
	"verified": true
},
{
	"id": 3471,
	"number": 3471,
	"parent": 0,
	"event": "push",
	"status": "success",
	"enqueued_at": 3,
	"created_at": 3,
	"started_at": 3,
	"finished_at": 3,
	"deploy_to": "",
	"commit": "ghj",
	"branch": "new-feature",
	"ref": "refs/heads/new-feature",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mrs super",
	"author_avatar": "www.avatars.com/mrssuper.jpg",
	"author_email": "mrssuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo/commit/abc",
	"signed": true,
	"verified": true
},
{
	"id": 3472,
	"number": 3472,
	"parent": 0,
	"event": "push",
	"status": "running",
	"enqueued_at": 4,
	"created_at": 4,
	"started_at": 4,
	"finished_at": 4,
	"deploy_to": "",
	"commit": "xyz",
	"branch": "patch-bug",
	"ref": "refs/heads/patch-bug",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mrs super",
	"author_avatar": "www.avatars.com/mrssuper.jpg",
	"author_email": "mrssuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo/commit/abc",
	"signed": true,
	"verified": true
}]
'

FILTERED_DRONE_DATA_REPO1 = '
[{
	"id": 3470,
	"number": 3470,
	"parent": 0,
	"event": "push",
	"status": "failure",
	"enqueued_at": 2,
	"created_at": 2,
	"started_at": 2,
	"finished_at": 2,
	"deploy_to": "",
	"commit": "def",
	"branch": "master",
	"ref": "refs/heads/master",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mr super",
	"author_avatar": "www.avatars.com/mrsuper.jpg",
	"author_email": "mrsuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo/commit/abc",
	"signed": true,
	"verified": true
},
{
	"id": 3471,
	"number": 3471,
	"parent": 0,
	"event": "push",
	"status": "success",
	"enqueued_at": 3,
	"created_at": 3,
	"started_at": 3,
	"finished_at": 3,
	"deploy_to": "",
	"commit": "ghj",
	"branch": "new-feature",
	"ref": "refs/heads/new-feature",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mrs super",
	"author_avatar": "www.avatars.com/mrssuper.jpg",
	"author_email": "mrssuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo/commit/abc",
	"signed": true,
	"verified": true
},
{
	"id": 3472,
	"number": 3472,
	"parent": 0,
	"event": "push",
	"status": "running",
	"enqueued_at": 4,
	"created_at": 4,
	"started_at": 4,
	"finished_at": 4,
	"deploy_to": "",
	"commit": "xyz",
	"branch": "patch-bug",
	"ref": "refs/heads/patch-bug",
	"refspec": "",
	"remote": "https://github.com/UKHomeOffice/test-repo.git",
	"title": "",
	"message": "A super commit",
	"timestamp": 0,
	"author": "mrs super",
	"author_avatar": "www.avatars.com/mrssuper.jpg",
	"author_email": "mrssuper@gmole.com",
	"link_url": "https://github.com/UKHomeOffice/test-repo/commit/abc",
	"signed": true,
	"verified": true
}]
'