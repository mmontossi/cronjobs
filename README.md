[![Gem Version](https://badge.fury.io/rb/cronjobs.svg)](http://badge.fury.io/rb/cronjobs)
[![Code Climate](https://codeclimate.com/github/mmontossi/cronjobs/badges/gpa.svg)](https://codeclimate.com/github/mmontossi/cronjobs)
[![Build Status](https://travis-ci.org/mmontossi/cronjobs.svg)](https://travis-ci.org/mmontossi/cronjobs)
[![Dependency Status](https://gemnasium.com/mmontossi/cronjobs.svg)](https://gemnasium.com/mmontossi/cronjobs)

# Cronjobs

DSL to manage cronjobs in rails.

## Install

Put this line in your Gemfile:
```ruby
gem 'cronjobs'
```

Then bundle:
```
$ bundle
```

## Usage

Generate the definitions file:
```
$ bundle exec rails g cronjobs:install
```

Define your cronjobs inside:
```ruby
Cronjobs.define do

  env 'PATH=$PATH:/usr/local/bin'
  mailto 'test@mail.com'
  output Rails.root.join('log/cronjobs.log')

  every '* 1 * * *' do
    rake 'certificates:check'
  end

end
```

In your deploy recipe use the rake task to update the cronjobs:
```
$ bundle exec rake cronjobs:update
```

## Credits

This gem is maintained and funded by [mmontossi](https://github.com/mmontossi).

## License

It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.
