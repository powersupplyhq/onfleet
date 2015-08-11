# Onfleet Ruby SDK

Ruby SDK for Onfleet.com's API. **This is NOT an official SDK**. [Official Documentation](http://docs.onfleet.com/docs/). The entirety of the response payload is accessible by instance methods. The raw response can is accessible through the `params` instance method on all objects.


## Usage
Install the gem.
```bash
gem install ruby
```

Set the API Key.
```ruby
Onfleet.api_key = API_KEY
```

Objects
```ruby
Onfleet::Organization
Onfleet::Admin
Onfleet::Worker
Onfleet::Team
Onfleet::Destination
Onfleet::Recipient
Onfleet::Task
```

## Organizations

**GET**

```ruby
org = Onfleet::Organization.get
org.id # => 1234567890
org.name # => OrgName
org.email # => org@email.com
org.country # => United States
org.delegatees # => ['delegatees_id']
org.timezone # => "America/Los_Angeles"
org.time_created # => 1438713844000
org.time_last_modified # => 1438713844000
```

**GET delegatee details**

```ruby
delegatee = Onfleet::Organization.get_delegatee_details(id)
delegatee.id # => "4eKRvRGA7JW6C8TaGyuJeSrK"
delegatee.name # => "North Beach Runners"
delegatee.email # => "hello@nbr.co"
delegatee.timezone # => "America/Los_Angeles"
delegatee.country # => "US"
```


## Administrators

Available parameters.

| Name        | Type   | Description  |
| ----------- |--------| --------------|
| name        | string | The administrator’s complete name. |
| email       | string | The administrator’s email address. |
| phone     | string | (Optional) The administrator's E.164-formatted phone number. |

**Create**

```ruby
admin = Onfleet::Admin.create({name: 'John Doe', email: 'john@company.com', phone: '41555546782'})
```

**Update**
```ruby
admin = Onfleet::Admin.update('ADMIN_ID', {name: 'New Name'})
# or
admin.name = "New Name"
admin.save
```

**Delete**
```ruby
Onfleet::Admin.delete('ADMIN_ID') # => true
```

**List**
```ruby
list = Onfleet::Admin.list # => [<Onfleet::Admin>]
list.first # => Onfleet::Admin
```

## Workers
Worker
| Name        | Type   | Description  |
| ----------- |--------| --------------|
| name        | string | The workers complete name. |
| phone       | string | The worker's phone number. |
| teams     | string Array | One or more team IDs of which the worker is a member.|
| vehicle     | obect | (Optional) The worker’s vehicle, providing no vehicle details is interpreted as the worker being on foot. |

Vehicle
| Name          | Type   | Description  |
| ------------- |--------| --------------|
| type          | string | The vehicle’s type, must be one of `CAR`, `MOTORCYCLE`, `BICYCLE` or `TRUCK`. |
| description   | string | (Optional) The vehicle’s make, model, year, or any other relevant identifying details. |
| license_plate | string | (Optional) The vehicle’s license plate number.|
| color         | string | (Optional) The worker’s vehicle, providing no vehicle details is interpreted as the worker being on foot. |


**Create**

```ruby
worker = Onfleet::Worker.create({name: 'John Doe', email: 'john@company.com', teams: ["TEAM_ID"], vehicle: {type: 'CAR'} })
worker.name # => "John Doe"
worker.vehicle.type # => "CAR"

worker.vehicle.color = "Blue"
worker.save

worker.vehicle.color # => "Blue"
```

**Update**
```ruby
Onfleet::Worker.update({name: "New Name"}
# or
worker.name = "New Name"
work.save
worker.name # => "New Name"
```

**Delete**
```ruby
Onfleet::Worker.delete('WORKER_ID') # => true
```

**List**
```ruby
Onfleet::Worker.list
```

**Get**
```ruby
worker = Onfleet::Worker.get('WORKER_ID')
```

## Teams

**List**
```ruby
Onfleet::Team.list
```

**Get**
```ruby
Onfleet::Team.get('TEAM_ID')
```

## Destinations
Destination
| Name        | Type   | Description  |
| ----------- |--------| --------------|
| address        | object | The destination’s street address details. |
| location       | array | (Optional) The `[ longitude, latitude ]` geographic coordinates. If missing, the API will geocode based on the `address` details provided. Note that geocoding may slightly modify the format of the address properties. |
| notes     | string | (Optional) Notes for the destination |

Address
| Name        | Type   | Description  |
| ----------- |--------| --------------|
| number       | string | The number component of this address, it may also contain letters. |
| street     | string | The street name |
| city     | string | The city name |
| country     | string | Name Of Country|
| apartment     | string | (Optional) The apartment or suite number |
| name        | string | (Optional) A name associated with this address |
| state     | string |  (Optional) State name |
| postal_code     | string | (Optional) The postal code |
| unparsed     | string | (Optional) A complete comma seperated address for ex. `148 townsend, 94102, USA`. Including this field, all other address details will be ignored. The address will be automatically geocoded. |




**Create**
```ruby
destination = Onfleet::Destination.create({address: {unparsed: '200 12th st, 94103, ca'} })

destination.street # => '12th street'
destination.number # => '200'
destination.postal_code # => '94103'
```

**Get**
```ruby
Onfleet::Destination('DEST_ID')
```

## Recipients
| Name        | Type   | Description  |
| ----------- |--------| --------------|
| name        | string | The recipient's full name. |
| phone       | string | A unique valid phone number. |
| notes     | string | (Optional) Notes for the recipient. |
| skip_sms_notifications     | boolean | (Optional) To disable sms notification. Defaults to `false` |
| skip_phone_number_verificaton     | boolean | (Optional) Whether to skip validation of the phone number. |

**Create**
```ruby
recipient = Onfleet::Recipient.create({name: 'John Doe', phone: '4155556789'})
recipient.id # => ChdA82dA~Dn232
recpient.name # => 'John Doe'
```

**Update**
```ruby
Onfleet::Recipient.update('REC_ID', {name: 'New Name'})
# or
recipient.name = "New Name"
recipient.save
```

**Get**
```ruby
Onfleet::Recipient.get('REC_ID')
```

**Find**

>######Note:
**Throws `InvalidRequestError` if cannot find resource**

```ruby
# by name (case sensitive)
rec = Onfleet::Recipient.find('name', 'John Doe')
rec.name = "John Doe"

#by phone
rec = Onfleet::Recipient.find('phone', '4155556789')
```

##Tasks
| Name        | Type   | Description  |
| ----------- |--------| --------------|
| destination     | string | `ID` of the destination. |
| recipients     | string array | An array containing zero or one IDs of the task's recipients |
| merchant        | string | (Optional) `ID` of merchant organization. |
| executor       | string | (Optional) `ID` of the executor organization. |
| complete_after     | number | (Optional)  A timestamp for the earliest time the task should be completed. |
| complete_before     | number | (Optional) A timestamp for the latest time the task should be completed. |
| pickup_task     | boolean | (Optional) Whether the task is a pickup task. |
| dependencies     | string array | (Optional) One or more IDs of tasks which must be completed prior to this task. |
| notes     | notes | (Optional) Notes for the task. |
| auto_assign     | object | (Optional) The automatic assignment options for the newly created task. See above for exact object structure and allowed values. |

**Create**
```ruby
# First Create a destination and Recipient
# Then create the task
task = Onfleet::Task.create({recipient: ['REC_ID'], destination: 'DEC_ID' })
```

**Update**
```ruby
Onfleet::Task.update('TASK_ID', {notes: 'Adding some notes'})
# or
task.notes = "Adding some notes"
task.save
```

**Get**
```ruby
task = Onfleet::Task.get('TASK_ID')
```

**Delete**
```ruby
Onfleet::Task.delete('TASK_ID')
```
**List**
```ruby
Onfleet::Task.list
# You can also list tasks of certain states
Onfleet::Task.list({state: 0}) # => returns all tasks with state 0, see official docs for valid states
```

**Complete**
Currently not supported


## TODO
1. Tests
2. Better error handling
