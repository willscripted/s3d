<p align="center">
  <img width="320px" height="320px" src="https://raw.githubusercontent.com/will-ob/precheck/master/precheck.jpg" />
</p>
<p align="center">Image creds to <a href="https://www.flickr.com/photos/moto_club4ag/">Moto "Club4AG" Miwa</a> via <a href="https://www.flickr.com/photos/moto_club4ag/19015051458">Flickr</a></p>


Precheck & Deploy
============

Precheck and deploy apps to s3.

```
- assert correct aws account
- assert clean working directory
- assert consistent deployment url
- assert consistent bucket options (eg `--delete`, `--cache`)
- consolidates deploy code between apps
- allows "deploy" to local server
- displays url of app in s3
- displays url of app in cdns
- post-deploy hooks
```

Use
------

```
# any of ..
s3d deploy .s3.production
s3d deploy .s3.staging
s3d deploy .s3.local
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

See [examples]().

```
# Any suffix (prod, test, local)
s3d configure <suffix>
```


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
