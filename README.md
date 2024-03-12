Base Service Model for Ruby
=======================

## What is this?

It's a small library to act as a base service for others to inherit from. It provides a simple way to return a result from a service, and to handle errors.

## Usage

Calling a service looks like: MyService.call(opt1: "foo", opt2: "bar")

## Configuration

```ruby
# to use globally from congif/application.rb
require 'base_service'
```

## Testing

# If using docker
* Build the image:
`docker build -t base-service-ruby .`
* Run the tests:
`docker run -it base-service-ruby rake`

# If using local ruby
* Run the tests:
`rake`



## Copyright and License

Copyright (c) [2024] [icanmakeitbetter]

This project is licensed under the [MIT License](LICENSE.md).
