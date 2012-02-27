## Install

```
$ gem install usercycle
```

## Usage

### Setup

``` ruby
require 'usercycle'

# put your own credentials here
api_key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

# set up a client to talk to the USERCycle API
@client = Usercycle::Client.new api_key
```

###  List events by identity

```ruby
@client.event.find_by_identity('john.smith@example.com')
```

### Creating an event

```ruby
@client.event.create('john.smith@example.com', 'signed_up', :first_name => 'John', :last_name => 'Smith'
```

## Full Documentation

For full API documentation visit the official USERCycle docs at http://docs.usercycle.com/rest_api