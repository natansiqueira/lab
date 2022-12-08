# Ruby exceptions

A way of dealing of unexpected events. When an exception occurs our program stops and if not handled will eventually exit with an error message.

When facing an exception we want to be able to deal with it intelligently. We do that "rescuing", "rescuing" or "catching" the exception doing so or program keeps running and doesn't crash.

```ruby
begin
  // some code
  3 / 0
rescue
  puts "An exception, but we can handle it!"
  // some code to 
end
```

We can get information about what went wrong using Exception Objects plus we're able to inspect the object to get more info and fix the expection we're catching.

```ruby
rescue => e
```

> Rescues all errors, and puts the exception object in `e`

```ruby
rescue ZeroDivisionError => e
```

> Rescues only ZeroDivisionError

```ruby
begin
  // some code
  3 / 0
rescue ZeroDivisionError => e
  puts "Exception Class: #{ e.class.name }"
  puts "Exception Message: #{ e.message }"
  puts "Exception Backtrace: #{ e.backtrace }"
end
```