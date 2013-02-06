For full API documentation visit the official USERcycle docs at http://docs.usercycle.com/rest_api

## Install

Add to Gemfile:

```
gem 'usercycle', :git => 'git://github.com/usercycle/usercycle-api-ruby.git'
```

## Setup

``` ruby
require 'usercycle'

# put your own credentials here
api_key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

# set up a client to talk to the USERcycle API
@client = Usercycle::Client.new api_key
```

## Events

### Find by identity

```ruby
identity = 'john.smith@example.com' #required
@client.event.find_by_identity(identity)
```

### Create

```ruby
identity = 'john.smith@example.com' #required
action = 'signed_up' #required
properties = { :first_name => 'John', :last_name => 'Smith' } #optional
occurred_at = 5.days.ago #optional
@client.event.create(identity, action, properties, occurred_at)
```
`#create` will return false if there was a communication error. If it's
critical this data get into USERcycle, you should retry the operation.

### Get

```ruby
@client.event.get(uuid)
```

## People

Coming soon.

## Cohorts

Cohorts are used to group your users and track their actions over time.
There are 3 types of cohort intervals - daily, weekly, and monthly.

### Stats

Returns the last four sets of cohort metrics from the specified
starting date. You can override the count by passing an optional second
parameter.

We will automatically adjust passed dates to conform to the API
requirements for weekly (date must be a Monday) and monthly (date must
be the 1st of the month).

```ruby
@client.cohort.stats.get_daily(start_date, [count])
@client.cohort.stats.get_weekly(start_date, [count])
@client.cohort.stats.get_monthly(start_date, [count])
```

### Users

You can also retrieve a list of users who belong to a cohort according
to one of the following macros:

* AARRR (default)
* activated
* retained
* trial
* billed

```ruby
@client.cohort.people.get_daily(start_date, [macro])
@client.cohort.people.get_weekly(start_date, [macro])
@client.cohort.people.get_monthly(start_date [macro])
```

### License

usercycle-api-ruby is licensed under the 3-clause BSD license, see LICENSE file for details.

