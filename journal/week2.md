# Terraform Begineer Bootcamp 2023 - Week 2

Note week 2 is mainly ruby and go programming.

The Terraform provider here you really need to know the golang language

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

## Programming Languages

This section of the bootcamp is very confusing as there are talks about schema's Golang and Ruby scripts which if you have never seen them before can be confusing.

Watching Andrew go through the video and drawing the diagrams explaining things was ok but the Ruby code and Go code is very confusing for a beginner

At this point just accept the code that Andrew has written and if we need to do into more details then we can look at the Freecodecamp courses listed below

## Ruby

[Ruby Course From FreeCodeCamp](https://www.freecodecamp.org/news/learning-ruby-from-zero-to-hero-90ad4eecc82d/)

## Go

[Golang Course From FreeCodeCamp](https://www.freecodecamp.org/news/go-golang-course/)

## Drawing Package

[Lucid App](https://lucid.app)

From Andrews Video - here is my drawing
[My Drawing](Diagrams/terratown-web.pdf)

Note unable to do the second part of the drawing due to having a free trial.

Maybe look at another drawing package such as [draw.io](https://app.diagrams.net/) in the future.


## Joes Beers

I've managed to replace references to Arcanum with Joes Gluten Free Beers
The images have come through ok but the styling is all wrong.
Looks like the style.css file is not being picked up whilst in the terratowns frame