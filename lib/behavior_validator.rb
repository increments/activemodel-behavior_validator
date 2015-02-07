class BehaviorValidator < ActiveModel::EachValidator
  class << self
    def valid?(value, options = {})
      options = options.reject { |option| reserved_options.include?(option) }
      options.each_pair.all? do |method, expected_result|
        value.__send__(method) == expected_result
      end
    rescue NoMethodError
      false
    end

    def reserved_options
      [:allow_nil, :allow_blank, :message, :on]
    end
  end

  def validate_each(record, attribute, value)
    unless self.class.valid?(value, options)
      record.errors.add(attribute, options[:message] || :invalid_behavior)
    end
  end
end
