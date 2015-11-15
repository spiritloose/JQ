use strict;
use warnings;
use Test::More;

use JQ;

eval 'use Test::LeakTrace 0.08';
plan skip_all => "Test::LeakTrace 0.08 required for testing leak trace" if $@;
plan tests => 1;

my $json = join '', <DATA>;

no_leaks_ok(sub {
    jq '.[]', $json;
    eval { jq 'x', '' };
    eval { jq '.', 'x' };
});

__END__
[
  {
    "sha": "8f115e9eed8e71816b9f3a86e0d3aabd47a750d9",
    "commit": {
      "author": {
        "name": "Nicolas Williams",
        "email": "nico@cryptonector.com",
        "date": "2015-10-28T00:01:06Z"
      },
      "committer": {
        "name": "Nicolas Williams",
        "email": "nico@cryptonector.com",
        "date": "2015-10-28T01:06:21Z"
      },
      "message": "Add address sanitizer (ASAN) support (fix #1002)",
      "tree": {
        "sha": "f4631abbc843cc80b1cea12a8d126ac6d5e3b52d",
        "url": "https://api.github.com/repos/stedolan/jq/git/trees/f4631abbc843cc80b1cea12a8d126ac6d5e3b52d"
      },
      "url": "https://api.github.com/repos/stedolan/jq/git/commits/8f115e9eed8e71816b9f3a86e0d3aabd47a750d9",
      "comment_count": 0
    },
    "url": "https://api.github.com/repos/stedolan/jq/commits/8f115e9eed8e71816b9f3a86e0d3aabd47a750d9",
    "html_url": "https://github.com/stedolan/jq/commit/8f115e9eed8e71816b9f3a86e0d3aabd47a750d9",
    "comments_url": "https://api.github.com/repos/stedolan/jq/commits/8f115e9eed8e71816b9f3a86e0d3aabd47a750d9/comments",
    "author": {
      "login": "nicowilliams",
      "id": 604851,
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "nicowilliams",
      "id": 604851,
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "e17ccf229723d776c0d49341665256b855c70bda",
        "url": "https://api.github.com/repos/stedolan/jq/commits/e17ccf229723d776c0d49341665256b855c70bda",
        "html_url": "https://github.com/stedolan/jq/commit/e17ccf229723d776c0d49341665256b855c70bda"
      }
    ]
  },
  {
    "sha": "e17ccf229723d776c0d49341665256b855c70bda",
    "commit": {
      "author": {
        "name": "David Tolnay",
        "email": "dtolnay@gmail.com",
        "date": "2015-10-18T05:44:40Z"
      },
      "committer": {
        "name": "David Tolnay",
        "email": "dtolnay@gmail.com",
        "date": "2015-10-25T19:40:15Z"
      },
      "message": "Support numbers and boolean in join (fix #930)",
      "tree": {
        "sha": "4ad441a1113162002daae2fcedec95e1834e03d4",
        "url": "https://api.github.com/repos/stedolan/jq/git/trees/4ad441a1113162002daae2fcedec95e1834e03d4"
      },
      "url": "https://api.github.com/repos/stedolan/jq/git/commits/e17ccf229723d776c0d49341665256b855c70bda",
      "comment_count": 0
    },
    "url": "https://api.github.com/repos/stedolan/jq/commits/e17ccf229723d776c0d49341665256b855c70bda",
    "html_url": "https://github.com/stedolan/jq/commit/e17ccf229723d776c0d49341665256b855c70bda",
    "comments_url": "https://api.github.com/repos/stedolan/jq/commits/e17ccf229723d776c0d49341665256b855c70bda/comments",
    "author": {
      "login": "dtolnay",
      "id": 1940490,
      "avatar_url": "https://avatars.githubusercontent.com/u/1940490?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dtolnay",
      "html_url": "https://github.com/dtolnay",
      "followers_url": "https://api.github.com/users/dtolnay/followers",
      "following_url": "https://api.github.com/users/dtolnay/following{/other_user}",
      "gists_url": "https://api.github.com/users/dtolnay/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/dtolnay/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/dtolnay/subscriptions",
      "organizations_url": "https://api.github.com/users/dtolnay/orgs",
      "repos_url": "https://api.github.com/users/dtolnay/repos",
      "events_url": "https://api.github.com/users/dtolnay/events{/privacy}",
      "received_events_url": "https://api.github.com/users/dtolnay/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "dtolnay",
      "id": 1940490,
      "avatar_url": "https://avatars.githubusercontent.com/u/1940490?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dtolnay",
      "html_url": "https://github.com/dtolnay",
      "followers_url": "https://api.github.com/users/dtolnay/followers",
      "following_url": "https://api.github.com/users/dtolnay/following{/other_user}",
      "gists_url": "https://api.github.com/users/dtolnay/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/dtolnay/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/dtolnay/subscriptions",
      "organizations_url": "https://api.github.com/users/dtolnay/orgs",
      "repos_url": "https://api.github.com/users/dtolnay/repos",
      "events_url": "https://api.github.com/users/dtolnay/events{/privacy}",
      "received_events_url": "https://api.github.com/users/dtolnay/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "8eb1367ca44e772963e704a700ef72ae2e12babd",
        "url": "https://api.github.com/repos/stedolan/jq/commits/8eb1367ca44e772963e704a700ef72ae2e12babd",
        "html_url": "https://github.com/stedolan/jq/commit/8eb1367ca44e772963e704a700ef72ae2e12babd"
      }
    ]
  },
  {
    "sha": "8eb1367ca44e772963e704a700ef72ae2e12babd",
    "commit": {
      "author": {
        "name": "Nicolas Williams",
        "email": "nico@cryptonector.com",
        "date": "2015-10-24T22:24:57Z"
      },
      "committer": {
        "name": "Nicolas Williams",
        "email": "nico@cryptonector.com",
        "date": "2015-10-24T22:27:56Z"
      },
      "message": "Heap buffer overflow in tokenadd() (fix #105)\n\nThis was an off-by one: the NUL terminator byte was not allocated on\nresize.  This was triggered by JSON-encoded numbers longer than 256\nbytes.",
      "tree": {
        "sha": "3d9a25a0d68eecd1ddac763a04f92dcc21d84655",
        "url": "https://api.github.com/repos/stedolan/jq/git/trees/3d9a25a0d68eecd1ddac763a04f92dcc21d84655"
      },
      "url": "https://api.github.com/repos/stedolan/jq/git/commits/8eb1367ca44e772963e704a700ef72ae2e12babd",
      "comment_count": 0
    },
    "url": "https://api.github.com/repos/stedolan/jq/commits/8eb1367ca44e772963e704a700ef72ae2e12babd",
    "html_url": "https://github.com/stedolan/jq/commit/8eb1367ca44e772963e704a700ef72ae2e12babd",
    "comments_url": "https://api.github.com/repos/stedolan/jq/commits/8eb1367ca44e772963e704a700ef72ae2e12babd/comments",
    "author": {
      "login": "nicowilliams",
      "id": 604851,
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "nicowilliams",
      "id": 604851,
      "avatar_url": "https://avatars.githubusercontent.com/u/604851?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/nicowilliams",
      "html_url": "https://github.com/nicowilliams",
      "followers_url": "https://api.github.com/users/nicowilliams/followers",
      "following_url": "https://api.github.com/users/nicowilliams/following{/other_user}",
      "gists_url": "https://api.github.com/users/nicowilliams/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/nicowilliams/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/nicowilliams/subscriptions",
      "organizations_url": "https://api.github.com/users/nicowilliams/orgs",
      "repos_url": "https://api.github.com/users/nicowilliams/repos",
      "events_url": "https://api.github.com/users/nicowilliams/events{/privacy}",
      "received_events_url": "https://api.github.com/users/nicowilliams/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "2f79004f856532c479b79e226798a3dcc0a127f0",
        "url": "https://api.github.com/repos/stedolan/jq/commits/2f79004f856532c479b79e226798a3dcc0a127f0",
        "html_url": "https://github.com/stedolan/jq/commit/2f79004f856532c479b79e226798a3dcc0a127f0"
      }
    ]
  },
  {
    "sha": "2f79004f856532c479b79e226798a3dcc0a127f0",
    "commit": {
      "author": {
        "name": "David Tolnay",
        "email": "dtolnay@gmail.com",
        "date": "2015-10-24T18:23:37Z"
      },
      "committer": {
        "name": "David Tolnay",
        "email": "dtolnay@gmail.com",
        "date": "2015-10-24T18:23:56Z"
      },
      "message": "strptime() on OpenBSD requires _XOPEN_SOURCE_EXTENDED 1 (fix #999)\n\nstrptime() is an XPG4v2 function, on OpenBSD the prototype\nis not included in time.h unless visibility is set, it needs\neither \"#define _XOPEN_SOURCE_EXTENDED 1\" or _XOPEN_SOURCE\n>= 500. Without this the prototype isn't included and\nstrptime's returned pointer is truncated to an int, causing\nSEGV on 64-bit arches when using it.\n\nThanks @sthen",
      "tree": {
        "sha": "13e7acf07fdfacaf2bd814460f253e4482e5ff28",
        "url": "https://api.github.com/repos/stedolan/jq/git/trees/13e7acf07fdfacaf2bd814460f253e4482e5ff28"
      },
      "url": "https://api.github.com/repos/stedolan/jq/git/commits/2f79004f856532c479b79e226798a3dcc0a127f0",
      "comment_count": 0
    },
    "url": "https://api.github.com/repos/stedolan/jq/commits/2f79004f856532c479b79e226798a3dcc0a127f0",
    "html_url": "https://github.com/stedolan/jq/commit/2f79004f856532c479b79e226798a3dcc0a127f0",
    "comments_url": "https://api.github.com/repos/stedolan/jq/commits/2f79004f856532c479b79e226798a3dcc0a127f0/comments",
    "author": {
      "login": "dtolnay",
      "id": 1940490,
      "avatar_url": "https://avatars.githubusercontent.com/u/1940490?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dtolnay",
      "html_url": "https://github.com/dtolnay",
      "followers_url": "https://api.github.com/users/dtolnay/followers",
      "following_url": "https://api.github.com/users/dtolnay/following{/other_user}",
      "gists_url": "https://api.github.com/users/dtolnay/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/dtolnay/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/dtolnay/subscriptions",
      "organizations_url": "https://api.github.com/users/dtolnay/orgs",
      "repos_url": "https://api.github.com/users/dtolnay/repos",
      "events_url": "https://api.github.com/users/dtolnay/events{/privacy}",
      "received_events_url": "https://api.github.com/users/dtolnay/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "dtolnay",
      "id": 1940490,
      "avatar_url": "https://avatars.githubusercontent.com/u/1940490?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dtolnay",
      "html_url": "https://github.com/dtolnay",
      "followers_url": "https://api.github.com/users/dtolnay/followers",
      "following_url": "https://api.github.com/users/dtolnay/following{/other_user}",
      "gists_url": "https://api.github.com/users/dtolnay/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/dtolnay/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/dtolnay/subscriptions",
      "organizations_url": "https://api.github.com/users/dtolnay/orgs",
      "repos_url": "https://api.github.com/users/dtolnay/repos",
      "events_url": "https://api.github.com/users/dtolnay/events{/privacy}",
      "received_events_url": "https://api.github.com/users/dtolnay/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "b7a219a91dc1094022478dd9bc0f60275367ce25",
        "url": "https://api.github.com/repos/stedolan/jq/commits/b7a219a91dc1094022478dd9bc0f60275367ce25",
        "html_url": "https://github.com/stedolan/jq/commit/b7a219a91dc1094022478dd9bc0f60275367ce25"
      }
    ]
  },
  {
    "sha": "b7a219a91dc1094022478dd9bc0f60275367ce25",
    "commit": {
      "author": {
        "name": "David Tolnay",
        "email": "dtolnay@gmail.com",
        "date": "2015-10-24T18:21:16Z"
      },
      "committer": {
        "name": "David Tolnay",
        "email": "dtolnay@gmail.com",
        "date": "2015-10-24T18:21:18Z"
      },
      "message": "mktemp needs 6 or more X's (fix #1000)\n\nmktemp(1) isn't posix specified, but it's reasonable to use\nmktemp(3) to implement it which requires 6 trailing X's in\nthe format\n\nThanks @sthen",
      "tree": {
        "sha": "51a2283f5630f9deca88e9ccf6955ab48555db02",
        "url": "https://api.github.com/repos/stedolan/jq/git/trees/51a2283f5630f9deca88e9ccf6955ab48555db02"
      },
      "url": "https://api.github.com/repos/stedolan/jq/git/commits/b7a219a91dc1094022478dd9bc0f60275367ce25",
      "comment_count": 0
    },
    "url": "https://api.github.com/repos/stedolan/jq/commits/b7a219a91dc1094022478dd9bc0f60275367ce25",
    "html_url": "https://github.com/stedolan/jq/commit/b7a219a91dc1094022478dd9bc0f60275367ce25",
    "comments_url": "https://api.github.com/repos/stedolan/jq/commits/b7a219a91dc1094022478dd9bc0f60275367ce25/comments",
    "author": {
      "login": "dtolnay",
      "id": 1940490,
      "avatar_url": "https://avatars.githubusercontent.com/u/1940490?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dtolnay",
      "html_url": "https://github.com/dtolnay",
      "followers_url": "https://api.github.com/users/dtolnay/followers",
      "following_url": "https://api.github.com/users/dtolnay/following{/other_user}",
      "gists_url": "https://api.github.com/users/dtolnay/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/dtolnay/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/dtolnay/subscriptions",
      "organizations_url": "https://api.github.com/users/dtolnay/orgs",
      "repos_url": "https://api.github.com/users/dtolnay/repos",
      "events_url": "https://api.github.com/users/dtolnay/events{/privacy}",
      "received_events_url": "https://api.github.com/users/dtolnay/received_events",
      "type": "User",
      "site_admin": false
    },
    "committer": {
      "login": "dtolnay",
      "id": 1940490,
      "avatar_url": "https://avatars.githubusercontent.com/u/1940490?v=3",
      "gravatar_id": "",
      "url": "https://api.github.com/users/dtolnay",
      "html_url": "https://github.com/dtolnay",
      "followers_url": "https://api.github.com/users/dtolnay/followers",
      "following_url": "https://api.github.com/users/dtolnay/following{/other_user}",
      "gists_url": "https://api.github.com/users/dtolnay/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/dtolnay/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/dtolnay/subscriptions",
      "organizations_url": "https://api.github.com/users/dtolnay/orgs",
      "repos_url": "https://api.github.com/users/dtolnay/repos",
      "events_url": "https://api.github.com/users/dtolnay/events{/privacy}",
      "received_events_url": "https://api.github.com/users/dtolnay/received_events",
      "type": "User",
      "site_admin": false
    },
    "parents": [
      {
        "sha": "aa279ae7ac4271c4f23ebda1180164807b0b1d77",
        "url": "https://api.github.com/repos/stedolan/jq/commits/aa279ae7ac4271c4f23ebda1180164807b0b1d77",
        "html_url": "https://github.com/stedolan/jq/commit/aa279ae7ac4271c4f23ebda1180164807b0b1d77"
      }
    ]
  }
]
