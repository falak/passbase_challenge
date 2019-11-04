# README

This README would normally document whatever steps are necessary to get the
application up and running.


Things you may want to cover:

### Ruby and Rails version

* 2.6.3
* 5.2.3

### System dependencies

* postgresql

If you have not setup the postgresql before then install it first.
To do that follow the below tutorial.

For macosx.

https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-macos

### RVM and Ruby

It is typically recommended to install Ruby with RVM. With RVM, you can specify the version of Ruby you want
installed, plus a whole lot more (e.g. gemsets). Full installation instructions for RVM are [available online](http://rvm.io/rvm/install/).

This app is developed using Ruby 2.6.3 and we recommend using version 2.6.3 or higher. To install TeSS' current version of ruby and set ruby version 2.6.3 as default, you
can do something like the following:

    $ rvm install `cat .ruby-version`

    $ rvm use --default `cat .ruby-version`



### Setup Instructions

Run

	$ bundle install

### Database creation

	$ rails db:create


### Database initialization

Run

	$ rails db:migrate

	$ rails db:seed

### Usage Instructions

Run

	$ rails s

Get User credentials from seed file where user A and B is intialized with 1000 USD.

### Testing

	$ rails test