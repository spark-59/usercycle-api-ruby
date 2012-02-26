USERcycle Ruby API
==================

The official Ruby library for interacting with the USERcycle REST API. 

USERcycle (http://www.usercycle.com) helps startups engage with their customers 
by focusing on lifecycle messaging -- sending the right message at the 
right time -- to convert prospects into customers.

The USERcycle Ruby API gets USERcycle integrated into your website in seconds.


Installation
============

Add the following to your Gemfile

```
gem 'usercycle'
```


Configuration
=============

Sign up for a free account on http://www.usercycle.com and create a new product.  Once you 
do this, you'll configure USERcycle Ruby API as follows:

Documentation
=============

See lib/usercycle.rb

Also, documentation on the REST API can be found at http://docs.usercycle.com/rest_api


Examples
========

List events by identity

```ruby
client = Usercycle::Client.new(API_KEY)
client.event.find_by_identity('john.smith@example.com')
```

Creating an event

```ruby
client = Usercycle::Client.new(API_KEY)
client.event.create('john.smith@example.com', 'signed_up', :first_name => 'John', :last_name => 'Smith'
```

License
=======

Copyright (c) 2010 USERcycle, Inc. Released under the MIT license