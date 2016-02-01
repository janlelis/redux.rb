# redux.rb [![[version]](https://badge.fury.io/rb/redux.svg)](http://badge.fury.io/rb/redux)  [![[travis]](https://travis-ci.org/janlelis/redux.rb.png)](https://travis-ci.org/janlelis/redux.rb)

A [Redux](https://github.com/rackt/redux) implementation in Ruby.


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

Copyright (C) 2016 Jan Lelis <http://janlelis.com>. Released under the MIT license.
