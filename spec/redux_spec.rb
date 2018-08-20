require_relative "../lib/redux"
require "minitest/autorun"

describe Redux do
  describe Redux::Store do
    it "has nil as initial state if none given" do
      store = Redux::Store.new
      assert_equal nil, store.state
    end

    describe "example: counter reducer" do
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

      it "uses passed initial state" do
        store = Redux::Store.new(0, &reducer)
        assert_equal 0, store.state
      end

      it "can be incremented" do
        store = Redux::Store.new(0, &reducer)
        store.dispatch "type" => "INCREMENT"
        assert_equal 1, store.state
      end

      it "can be decremented" do
        store = Redux::Store.new(0, &reducer)
        store.dispatch "type" => "DECREMENT"
        assert_equal -1, store.state
      end

      it "can be subscribed to state changes" do
        callback_called = false
        store = Redux::Store.new(0, &reducer)
        store.subscribe { callback_called = true }
        store.dispatch "type" => "DECREMENT"
        assert_equal true, callback_called
      end

      it "can be unsubscribed from state changes" do
        callback_called = false
        store = Redux::Store.new(0, &reducer)
        unsubscribe = store.subscribe { callback_called = true }
        unsubscribe.call
        store.dispatch "type" => "DECREMENT"
        assert_equal false, callback_called
      end
    end
  end

  describe ".combine_reducers" do
    it "combines reducers" do
      potato_reducer = ->(state = 0, action) {
        case action['type']
        when "WORK"
          state + 1
        else
          state
        end
      }

      tomato_reducer = ->(state = 0, action) {
        case action['type']
        when "WORK"
          state - 1
        else
          state
        end
      }

      root_reducer = Redux.combine_reducers({potato: potato_reducer, tomato: tomato_reducer})
      store = Redux::Store.new({}, &root_reducer)
      store.dispatch "type" => "WORK"

      assert_equal(
        {
          potato: 1,
          tomato: -1,
        },
        store.state
      )
    end
  end
end

