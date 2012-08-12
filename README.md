## Install

Add to Gemfile:

```
gem 'usercycle', :git => 'git://github.com/usercycle/usercycle-api-ruby.git'
```

## Usage

### Setup

``` ruby
require 'usercycle'

# put your own credentials here
api_key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

# set up a client to talk to the USERcycle API
@client = Usercycle::Client.new api_key
```

###  List events by identity

```ruby
identity = 'john.smith@example.com' #required
@client.event.find_by_identity(identity)
```

### Creating an event

```ruby
identity = 'john.smith@example.com' #required
action = 'signed_up' #required
properties = { :first_name => 'John', :last_name => 'Smith' } #optional
occurred_at = 5.days.ago #optional
@client.event.create(identity, action, properties, occurred_at)
```
`#create` will return false if there was a communication error. If it's
critical this data get into USERcycle, you should retry the operation.

### Getting an event

```ruby
@client.event.get(uuid)
```

## Full Documentation

For full API documentation visit the official USERcycle docs at http://docs.usercycle.com/rest_api

