```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def value
    @value
  end

  def value=(new_value)
    @value = new_value
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.start_with?('get_')
      attribute = method_name.to_s[4..-1].to_sym
      return instance_variable_get('@'+attribute.to_s) if instance_variable_defined?('@'+attribute.to_s)
    elsif method_name.to_s.start_with?('set_')
      attribute = method_name.to_s[4..-1].to_sym
      instance_variable_set('@'+attribute.to_s, args[0])
    else
      super
    end
  end
end

my_object = MyClass.new(10)
puts my_object.value # => 10

my_object.value = 20
puts my_object.value # => 20

# Now, we can use the method_missing approach for cleaner access
my_object.set_my_attribute("hello")
puts my_object.get_my_attribute # => hello
```