# TESTING

Only continuous integration. More to come.

## Continuous Integration

To test that, at least, the simplest recipe is working, I put in place some continuous integration using [Travis](https://travis-ci.org).

This has been done following [what I had previously done on the wonderstuff example](https://github.com/esciara/wonderstuff/blob/master/README.md#continuous-integration), and particularly using what what has been done in the [Tomcat Cookbook in terms of continuous integration](https://github.com/opscode-cookbooks/tomcat/blob/master/TESTING.md#words-about-travisyml) with the difference that I used the [Travis file encryption feature](http://docs.travis-ci.com/user/encrypting-files/) instead of the AWK script with the base64 encoding, as it [gave me some trouble](https://travis-ci.org/esciara/chef-provisioning-examples/builds/47469370).

As a result, after creating my `.travis.yml` file, I did the following:

```
$ gem install travis
$ travis encrypt AWS_ACCESS_KEY_ID='your_bits_here' --add
$ travis encrypt AWS_SECRET_ACCESS_'your_bits_here' --add
$ travis encrypt-file travisci_chef_cook_ec2.pem --add
```

**NOTE** [For security reasons](http://docs.travis-ci.com/user/pull-requests/#Security-Restrictions-when-testing-Pull-Requests), any data encrypted with Travis' encryption feature is not available to pull requests from forks. Hence, testing from pull requests have been disabled using the exemple given in Travis' documentation:
```
script:
  - '[ "${TRAVIS_PULL_REQUEST}" = "false" ] && bundle exec rake tests:integration || false'
```
There could be a better way to handle this, as in "you could restrict these tests only to situations where the environment variables are available", but I don't know how to do that yet... So it will have to wait. In any case, it is a #TODO.

## Regular Periodic Automated Health Check with Tron-ci

The last build is regularly replaid to check that the project is still working fine despite dependencies updates. This is done using [Tron-CI](http://tron-ci.herokuapp.com/jobs/3563258/)