# No exception handling
# puts "before exception"
#
# 3 / 0
#
# puts "after exception, never gets executed"


# Handling exception but we don"t know what went wrong
# puts "before exception"
#
# begin
#     3 / 0
# rescue
#     puts "Something went wrong"
# end
#
# puts "the program doesn\"t crash and this puts gets executed"


# Handling exception and getting details about what went wrong
# puts "before exception"
#
# begin
#     3 / 0
# rescue ZeroDivisionError => e
#     puts "Exception Class: #{ e.class }"
#     puts "Exception Message: #{ e.message }"
#     puts "Exception Backtrace: #{ e.backtrace }"
# end
#
# puts "the program doesn't crash and this puts gets executed"

# # Raising our own exceptions
# puts "before exception"

# begin
#     raise ArgumentError.new("You've messed up!")
# rescue ArgumentError => e
#     puts e.message
# end

# puts "the program doesn't crash and this puts gets executed"

# Custom Exceptions
puts "before exception"

class PermissionDenied < StandardError
    attr_reader :action
    
    def initialize(message, action)
        super(message)

        @action = action
    end
end

begin
    raise PermissionDenied.new("Permission Denied", :delete)
rescue PermissionDenied => e
    puts "Exception Class: #{ e.class }"
    puts "Exception Message: #{ e.message }"
    puts "Exception Action: #{ e.action }"
end

puts "the program doesn't crash and this puts gets executed"