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
    puts "debug: current_state is a #{current_state.class.name}"

    raise ArgumentError.new('invalid event type') if event['type'].nil? || !event['type'].eql?('click')

    raise ArgumentError.new('invalid click coordinates') if event['data'].nil? || event['data']['x'].nil? || event['data']['y'].nil?

    coordinates = Coordinates.new(event['data']['x'],event['data']['y'])

    current_state.toggle_neighbors_of coordinates

    current_state
  end

end
