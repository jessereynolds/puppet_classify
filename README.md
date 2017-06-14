# PuppetComply

## WARNING

This is a work in progress and will probably cause you to burst into flames. Use at your own risk.

This gem seeks to provide a mechamism to test arbritrary Puppet modules for compliance against some security spec. The modules under test must contain rspec tests for this gem to inject the rspec shared examples into.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'puppet_comply'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install puppet_comply

## Usage

Initialise a new set of compliace tests:

```
puppet_comply init
```

Add that resulting directory to a git repo so that you can use it as follows:

```
# download your general purpose compliance tests
git clone git://git.example/foo/compliance_tests.git

# check any module for compliance with your tests
cd compliance_tests
puppet_comply check --forge-module puppetlabs/motd
```

Uses [librarian-puppet](https://github.com/voxpupuli/librarian-puppet) to resolve and install dependencies declared in metadata.json from the Puppet Forge.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jessereynolds/puppet_comply. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

