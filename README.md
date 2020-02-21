# capistrano/local_branch_check

This gem check local git branch before all Capistrano tasks, to prevents deployment in wrong branch (that branch may contain unexpected deploy configurations).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-local_branch_check'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-local_branch_check

## Usage

Add line below to `Capifile`.

```ruby
require "capistrano/local_branch_check"
```

If local branch is equal to release branch, no configuration required.
If local branch is differ from release branch, please set `local_branch` variable like below.

```ruby
set :branch, "v2"
set :local_branch, "master"
```

When you run `cap` command (with stage name), checks local branch. And if it is wrong, prints message below and abort deployment.

        ================================================================================
        !!! Local branch `master` maybe wrong. Please `git checkout release`. !!!
        ================================================================================

If you want to skip check, please set `skip_local_branch_check` variable to `true`.

```ruby
set :skip_local_branch_check, true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/labocho/capistrano-local_branch_check.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
