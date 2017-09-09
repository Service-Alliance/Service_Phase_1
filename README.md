![Cloud66](https://app.cloud66.com/stacks/badge/f3e65df9edad6603f34a68933bbc4d1f.svg)

## Getting started

- Be sure to have **rvm** or **rbenv**
- be sure to have **bundler gem** installed.
- Check that your IDE can handle [.editorconfig](http://editorconfig.org) file
- `bundle install`
- `rake db:setup`
- Use `Procfile` to start application (lookup [Foreman](https://github.com/ddollar/foreman),
[Hivemind](https://github.com/DarthSim/hivemind) or [Overmind](https://github.com/DarthSim/overmind))

## Development
### Rails gotchas
- Avoid using `ENV['VARIABLE']` in favor of `ENV.fetch('VARIABLE')`. So if ENV variable is missing, app will fail during bootup.

### Migrations

Please use separate migrations for data/schema changes.

In case of schema changes, use standard Rails functionality:

```ruby
rails g migration MyNewMigration
```

In case of data use seed_migration gem, like this:

```ruby
rails g seed_migration NewDataMigration
```

### Deployment
Server needs to be properly configured for deployment to work.

- SSH public/private key pair set up
- deploy user to have access to folders where you want to install the application
- installed git
- installed ruby (some ruby manager recommended rbenv/rvm/chruby)
- installed bundler


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
