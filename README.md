# KzuDataMigrator

Use it if you want manipulate data migration completely outside of the schema migration process.


### Usage
````bash
$ rails g kzu_data_migration MigrateUserName
      create  db/data-migrate/20160115173103_migrate_user_name.rb
````

````bash
$ rake db:data:migrate
````

Or to a specific version

````bash
$ rake db:data:migrate:up VERSION=20160115173103
````

You could also downgrade
````bash
$ rake db:data:migrate:down VERSION=20160115173103
````

### Similar gems

[data-migrate](https://github.com/ajvargo/data-migrate)

[migration-data](https://github.com/ka8725/migration_data)

## Dependencies

Rails 4.2
ActiveRecord

## TODO

* Capistrano task
* tasks to migrate schema and data in one go

