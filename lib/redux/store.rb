module Redux
  class Store
    attr_reader :state

    def initialize(initial_state = nil, &reducer)
      @state     = initial_state
      @reducer   = reducer || ->(*){}
      @listeners = []
      dispatch({})
    end

    def dispatch(action)
      @state = @reducer.call(@state, action)
      @listeners.each{ |listener| listener.call() }
    end

    def subscribe(&listener)
      @listeners << listener
      ->{ @listeners.delete(listener) }
    end
  end
end

