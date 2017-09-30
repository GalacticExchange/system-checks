# Service to run health checks on your system

Useful to quickly run various checks to find problems in your system.

## Demo
View demo online: http://checks.friendlydata.com


## Overview

* Checks are run on the remote system using SSH connection


## Features

* Fully customizable checks

Future:
* Integration with monitoring systems to run checks periodically 
* Integration with notification systems to notify about problems in your system


## Quick start

* Clone the git repo
```ruby
git clone https://github.com/maxivak/rails-tpl
```

* Create database
* Import mysql dump from '__db' folder into database
* Change config/secrets.yml with your database settings

```
development:
  secret_key_base: your_key_1
  devise_secret_key: your_key_2

  db_host: your_db_host
  db_name: your_db_name
  db_user: your_db_user
  db_password: your_db_pwd

```

* Run `bundle install`
* Run `rake db:migrate`




## Requirements

* Rails ~> 4.2
* Ruby 2.2.4
* Redis server
* Imagemagick (For uploading pictures)




## Documentation
[Wiki](https://github.com/maxivak/rails-tpl/wiki)


