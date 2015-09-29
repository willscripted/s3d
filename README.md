<p align="center">
  <img width="320px" height="320px" src="https://cloud.githubusercontent.com/assets/1069495/9904600/0ee7c91e-5c4d-11e5-803b-e99cdf824154.jpg" />
</p>
<p align="center">Image creds to <a href="https://www.flickr.com/photos/moto_club4ag/">Moto "Club4AG" Miwa</a> via <a href="https://www.flickr.com/photos/moto_club4ag/19015051458">Flickr</a></p>


S3 Deploys
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
To localhost

Post-deploy hooks
Display CDN statuses


Verify
----------

Uploaded assets are accessable
Uploaded assets have correct headers
Cross-origin-bound assets are appropriately accessible

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

| Key  | Required  | Description | Example |
|---|:-:|---|---|
| `bucket` | x | Target s3 bucket. | `my.app.assets` |
| `build-dir`  | x | Folder of assets to upload. | `build` |
| `path`  | x | Path in bucket that should be uploaded to. | `/my/apps/folder/$git_tag` |
| `aws-account`  |  | Optional name of aws account to verify. | `jane-xx` |

**`path`** : The path can include `$git_tag` and `$git_sha1`. The corresponding values will be substituted in by `s3d`.





See [examples](https://github.com/will-ob/s3d/tree/master/examples) for example configurations generated with this command.


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
