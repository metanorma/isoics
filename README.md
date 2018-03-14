# IsoIcs

IsoIcs is International Classification for Standards codes reference.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'isoics'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install isoics

## Usage

Fetching ICS data:
```ruby
# Fetch field
ics = Isoics.fetch fieldcode: "01"
ics.code        # => "01"
ics.fieldcode   # => "01"
ics.description # => "Generalities. Terminology. Standardization. Documentation"

# Fetch group
ics = Isoics.fetch fieldcode: "01", groupcode: "020"
ics.code             # => "01.020"
ics.groupcode        # => "020"
ics.description_full # => "Generalities. Terminology. Standardization. Documentation. Terminology (principles and coordination)."
ics.notes            # => [#<Isoics::Note:0x007fd19e89d880 @text="Including terminography", @ics_code=nil>]

# Fetch subgroup
ics = Isoics.fetch fieldcode: "01", groupcode: "140", subgroupcode: "30"
ics.code         # => "01.140.30"
ics.subgroupcode # => "30"

note = ics.notes.first
note.text        # => "Technical product documentation, see {ics-code}"
note.ics_code    # => "01.140.30"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/isoics.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
