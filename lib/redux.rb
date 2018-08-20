require_relative "redux/version"
require_relative "redux/store"

module Redux
  def self.combine_reducers(reducers)
    ->(state = {}, action){
      reducers.reduce({}){ |next_state, (key, reducer)|
        if state.key?(key)
          next_state[key] = reducer.call(state[key], action)
        else
          next_state[key] = reducer.call(action)
        end

        next_state
      }
    }
  end
end