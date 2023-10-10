# Terraform Begineer Bootcamp 2023 - Week 2

## Working with Ruby

## Bundler

Bundler is a package manger for ruby.
It is the primary way to install ruby packages ( known as gems ) for ruby.

#### Installing Gems

You need to create a Gemfile and define your gems in that file.

# Notes
# Sinatra - Web server 
# rake - like make
# pry - For break points to help debugging
# puma - http server
# activarecord - object mapper for validation

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command
This will install the gems on the system globally (unlike nodejs which install packages in place in a folder called node_modules)

A Gemfile.lock will be create to lock down the gem versions used in this project.


#### Executing ruby scrpt in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed.
This is the we we see context.


#### Sinatra
Sinartra is a micro web-framework for ruby to build web-apps.

Its greate for mock or development servers or for very simple projects.

You can create a web-server in a single file.


https://sinatrarb.com/

## Terratowns Mock Server


### Running the web server

YOu can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our web server is stored in the `server.rb` file
