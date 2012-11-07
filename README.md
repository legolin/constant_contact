ConstantContact
===============
This is an ActiveResource ruby wrapper to the Constant Contact API.

See the [ActiveResource::Base docs](http://api.rubyonrails.org/classes/ActiveResource/Base.html) for more information on how to use this ActiveResource-based wrapper.

Examples
--------

All examples require setting up your Constant Contact API key and username/password:

```ruby
ConstantContact::Base.user_name = 'user'
ConstantContact::Base.api_key = 'api-key'
ConstantContact::Base.password = 'password'
```

### Find Lists

```ruby
ConstantContact::List.find(1)
ConstantContact::List.find :all
```

### Find A Contact

```ruby
ConstantContact::Contact.find(1)
ConstantContact::Contact.find(:first, :params => {:email => 'jon@example.com'})
ConstantContact::Contact.find_by_email('jon@example.com') # => same as previous line
```

### Create a Contact (with rescue if it already exists)

```ruby
ConstantContact::Base.user_name = 'user'
ConstantContact::Base.api_key = 'api-key'
ConstantContact::Base.password = 'password'

# If contact not found, create it.
begin
	@contact = ConstantContact::Contact.new(
		:email_address => "jon@example.com",
		:first_name => "jon",
		:last_name => "smith"
	)
	@contact.save
rescue ActiveResource::ResourceConflict => e
	# contact already exists
	puts 'Contact already exists. Saving contact failed.'
	puts e
end
```

### Find a Contact By Email Address, Check if They're a Member of the Default List

```ruby
c = ConstantContact::Contact.find_by_email('jon@example.com')
@contact = ConstantContact::Contact.find(c.int_id) # Because Constant Contact doesn't return a full contact when searching by email
puts 'In default contact list.' if @contact.contact_lists.include?(1) # contact_lists is an array of list ids
```

Changelog
---------

* 2.0.0 - First release compatible with (and dependent on) ActiveResource 3.2 from Rails 3.2


Copyright & License
-------------------

Copyright (C) 2012 Aaron Ten Clay, released under the MIT license.

Copyright (C) 2009 Timothy Case, released under the MIT license.