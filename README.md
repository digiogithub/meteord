# Meteor docker base image

This is a meteor base image updated for meteor 1.6.0.1

## MeteorD - Docker Runtime for Meteor Apps


#### From the Web

You can also simply give URL of the tarball with `BUNDLE_URL` environment variable. Then MeteorD will fetch the bundle and run it. This is how to do it:

~~~shell
docker run -d \
    -e ROOT_URL=http://yourapp.com \
    -e MONGO_URL=mongodb://url \
    -e MONGO_OPLOG_URL=mongodb://oplog_url \
    -e BUNDLE_URL=http://mybundle_url_at_s3.tar.gz \
    -p 8080:80 \
    meteorhacks/meteord:base
~~~


## Known Issues

#### Spiderable Not Working (But, have a fix)

There are some issues when running spiderable inside a Docker container. For that, check this issue: https://github.com/meteor/meteor/issues/2429

Fortunately, there is a fix. Simply use [`ongoworks:spiderable`](https://github.com/ongoworks/spiderable) instead the official package.

#### Container won't start on Joyent's Triton infrastructure

There's currently (2015-07-18) an issue relating to how the command or entry point is parsed, so containers won't boot using the 'docker run' commands as above.

Instead, Joyent support has suggested the following workaround until their fix can be rolled out.

~~~shell
docker run -d \
    -e ROOT_URL=http://yourapp.com \
    -e MONGO_URL=mongodb://url \
    -e MONGO_OPLOG_URL=mongodb://oplog_url \
    -p 80:80 \
    --entrypoint=bash \
    yourname/app \
    /opt/meteord/run_app.sh
~~~
