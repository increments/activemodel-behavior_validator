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
end
