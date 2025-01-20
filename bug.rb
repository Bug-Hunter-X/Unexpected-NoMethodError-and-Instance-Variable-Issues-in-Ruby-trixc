```ruby
class MyClass
  def initialize(value)
    @value = value
  end

  def value
    @value
  end
end

my_object = MyClass.new(10)
puts my_object.value # => 10

# Unexpected behavior when modifying the value
my_object.instance_variable_set(:@value, 20)
puts my_object.value # => 20

# Now trying to access a non-existent method
puts my_object.non_existent_method # => NoMethodError: undefined method `non_existent_method' for #<MyClass:0x00007f8b9383a4d0>
```