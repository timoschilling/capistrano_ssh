# Capistrano SSH

Open a ssh connection to one of the app servers.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano_ssh'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano_ssh

Require it in your Capfile or deploy.rb:

    require "capistrano_ssh/recipes"

## Usage

    $ cap ssh

## Todo / Roadmap

* use Capistrano API to run command, not build it by hand
* Tunnel support

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
