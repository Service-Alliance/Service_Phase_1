## Getting started

- Be sure to have **rvm** or **rbenv**
- be sure to have **bundler gem** installed.
- Check that your IDE can handle [.editorconfig](http://editorconfig.org) file
- `bundle install`
- `rake db:setup`
- Use `Procfile` to start application (lookup [Foreman](https://github.com/ddollar/foreman),
[Hivemind](https://github.com/DarthSim/hivemind) or [Overmind](https://github.com/DarthSim/overmind))

## Tooling

- [Trello](https://trello.com/b/zMV1ztiR/service-alliance-web-app)
- [Jenkins](http://34.226.74.30)


### Jenkins Credentials:
|Host Name|Jenkins|
----------|------------
|Public IP|34.226.74.30|
|Keypair| servicealliance-ops-key|


## Staging Infrastructure

### AWS Staging App Server Credentials
|Host Name|  servicealliance-staging-app|
---------|---------
|Public IP|  34.231.46.98|
|KeyPair|  servicealliance-staging-keypair|

### RDS Staging Database Credentials

  |Database|Staging|
  ---------|--------
  |Host|servicealliance-staging.c82auby89hhq.us-east-1.rds.amazonaws.com|
