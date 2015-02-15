# activemodel-behavior_validator

[![Build Status](https://travis-ci.org/yuku-t/activemodel-behavior_validator.svg?branch=master)](https://travis-ci.org/yuku-t/activemodel-behavior_validator) [![Code Climate](https://codeclimate.com/github/yuku-t/activemodel-behavior_validator/badges/gpa.svg)](https://codeclimate.com/github/yuku-t/activemodel-behavior_validator) [![Coverage Status](https://coveralls.io/repos/yuku-t/activemodel-behavior_validator/badge.svg)](https://coveralls.io/r/yuku-t/activemodel-behavior_validator) [![Dependency Status](https://gemnasium.com/yuku-t/activemodel-behavior_validator.svg)](https://gemnasium.com/yuku-t/activemodel-behavior_validator)

## Usage

Add to your Gemfile:

```rb
gem 'activemodel-behavior_validator'
```

Run:

```
bundle install
```

Then add the following to your model:

```rb
validates :my_attribute, behavior: { method_name => expected_result }
```

### Example

`Comment` must belong to a published public `Article`.

```rb
class Article < ActiveRecord::Base
  attr_accessible :date, :private

  def published?
    date > Time.now
  end
end

class Comment < ActiveRecord::Base
  belongs_to :article
  validates :article, behavior: { private?: false, published?: true }
end
```

## Validation outside a model

If you need to validate a outside a model, you can do that:

```rb
BehaviorValidator.valid?(object, { method_name => expected_result }
```
