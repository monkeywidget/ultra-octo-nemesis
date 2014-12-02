module LightsOutRuleEngine
  # LightsOutRuleEngine.default_state.json
  def hello
    'hello'
  end

  def default_state
    GridState.default_state(5,5)
  end

  # @param [Hash] event has key "type" and "data"
  def next_state_for(current_state, event)

    puts "debug: event is #{event}"

    current_state
  end

end
