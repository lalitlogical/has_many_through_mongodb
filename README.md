# HasManyThroughMongodb
Mongoid gem does not provide the has_many :through association. It's right because as a No SQL database MongoDB does not support these things. But sometimes required these association by building custom methods. So I had wrapped methods into this gems.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'has_many_through_mongodb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_many_through_mongodb

## Usage

has_many :through association functionality can be achievable by using `define_through` method into desired model. 

i.e. 
```
class Developer
  include Mongoid::Document
  include Mongoid::Timestamps
  ...
  has_many :developer_skills, dependent: :destroy
  define_through(RateCard: :DeveloperSkill, Skill: :DeveloperSkill)
  ...
end
```

This will make available below methods into implemented model.

# RateCard: :DeveloperSkill will create below methods
`has_rate_cards?, has_rate_card_ids?, rate_cards?, rate_cards`

# Skill: :DeveloperSkill will create below methods
`has_skills?, has_skill_ids?, skills?, skills`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lalitlogical/has_many_through_mongodb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HasManyThroughMongodb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lalitlogical/has_many_through_mongodb/blob/master/CODE_OF_CONDUCT.md).
