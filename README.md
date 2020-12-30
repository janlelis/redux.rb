# redux.rb [![[version]](https://badge.fury.io/rb/redux.svg)](https://badge.fury.io/rb/redux)  [![[ci]](https://github.com/janlelis/redux.rb/workflows/Test/badge.svg)](https://github.com/janlelis/redux.rb/actions?query=workflow%3ATest)

A [Redux](https://github.com/reduxjs/redux) implementation in Ruby.


## Setup

Add to your `Gemfile`:

```ruby
gem 'redux'
```


## Usage

```ruby
reducer = ->(state = 0, action){
  case action['type']
  when 'INCREMENT'
    state + 1
  when 'DECREMENT'
    state - 1
  else
    state
  end
}

store = Redux::Store.new(0, &reducer)
store.dispatch "type" => "INCREMENT"
store.state # => 1
```


## MIT License

Copyright (C) 2016 Jan Lelis <https://janlelis.com>. Released under the MIT license.
