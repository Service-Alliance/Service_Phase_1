== Getting started

- Be sure to have **rvm** or **rbenv**
- be sure to have **bundler gem** installed.
- Check that your IDE can handle [.editorconfig](http://editorconfig.org) file
- `bundle install` 
- `rake db:setup`
- Use `Procfile` to start application (lookup [Foreman](https://github.com/ddollar/foreman), 
[Hivemind](https://github.com/DarthSim/hivemind) or [Overmind](https://github.com/DarthSim/overmind))

== Tooling

## Staging Infrastructure

### AWS Staging App Server Credentials
|Host Name|  servicealliance-staging-app|
---------|---------
|Public IP|  34.231.46.98|
|KeyPair|  servicealliance-staging-keypair|

### Database Credentials

  |Database|Staging|
  ---------|--------
  |Host|servicealliance-staging.c82auby89hhq.us-east-1.rds.amazonaws.com|
  |Port|5432|
  |Username|postgres|
  |Password|35h5Hmq5H9|
  
### Jenkins Credentials:

[Jenkins URL](http://34.226.74.30)

|Host Name|Jenkins|
----------|------------
|Public IP|34.226.74.30|
|Keypair| servicealliance-ops-key|



|UserName|Password|
---------|-----------
|dev1| 57mGOQaj1nQD|
|dev2|hM5bR7nR8Yeo|
