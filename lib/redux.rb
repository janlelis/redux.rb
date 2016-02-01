require_relative "redux/version"
require_relative "redux/store"

module Redux
  def self.combine_reducers(reducers)
    ->(state = {}, action){
      reducers.reduce({}){ |next_state, (key, reducer)|
        next_state[key] = reducer.call(state[key], action)
      }
    }
  end
end