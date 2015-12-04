<p align="center">
  <img width="320px" height="320px" src="https://cloud.githubusercontent.com/assets/1069495/9904600/0ee7c91e-5c4d-11e5-803b-e99cdf824154.jpg" />
</p>
<p align="center">Image creds to <a href="https://www.flickr.com/photos/moto_club4ag/">Moto "Club4AG" Miwa</a> via <a href="https://www.flickr.com/photos/moto_club4ag/19015051458">Flickr</a></p>


Deploy to S3
============

Precheck, deploy, and verify S3 Assets.


Consistent, source-controlled asset deployments.
Consolidates deploy code between apps.

```
Precheck
----------

Correct upload target (bucket)
Correct path
Correct AWS creds
Assert clean working directory


Deploy
----------

To s3

Display CDN statuses
```

Use
------

```
# any of ..

s3d .s3.production
s3d .s3.staging
s3d .s3.local
```

Install
-----------

```
make install
```

Uninstall
-------

```
make uninstall
```

Config
---------

`.s3.production`

```
{

  "upload": {
    "dir": "build"
  },

  "aws": {
    "account": "my-prod-user",
    "keyfile": ".aws.prodkeys" // ** see details below
  },

  "bucket": {
    "name": "name.of.my.bucket",
    "path": "/project/$git_tag-$git_sha1",
    "options" "--cache-control max-age=2592000,public"
  },

  "cdns": {
    "cloudfront": "https://b33fgotm11k.cloudfront.net",
    "akamai": "https://e9474.b.akamaiedge.net"

    // etc ..

  }

}
```

**`path`** : The path can include `$git_tag` and `$git_sha1`. The corresponding values will be substituted in by `s3d`.
\*\* **aws.keyfile**: Optional file to source `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` from.

License
---------

Copyright 2015 Will O'Brien

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
