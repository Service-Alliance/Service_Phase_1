namespace :db do
  desc 'Copy production database to local database'
  task :copy => :environment do
    # This script assumes that your a normal person that runs all this on POSIX compliant system
    require 'fileutils'
    temp_file = 'tmp/latest.dump.tar'

    #TODO: would be nice to get latest dump from s3, not just static link to it.
    system("wget -O #{temp_file} https://s3.amazonaws.com/servicealliance-pg-dump/production/production-05092017-070427.dump.tar")
    system("tar -zxvf #{temp_file} -C tmp/")
    FileUtils.rm(temp_file)

    Rake::Task['db:rebuild'].invoke
  end

  desc 'Apply existing backup'
  task :rebuild => :environment do
    config = Rails.configuration.database_configuration["development"]
    database = config["database"]

    system("pg_restore --verbose --clean --no-acl --no-owner -h localhost -d #{database} #{Rails.root}/#{Dir.glob('tmp/*.dump').first
    }")
  end
end
