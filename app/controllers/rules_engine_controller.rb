include LightsOutRuleEngine

class RulesEngineController < ApplicationController

  respond_to :json

  # TODO: implement basic non-extensible logic

  # POST to get the next state
  # JSON in: rules set name, current grid state, incoming event
  # JSON out: next grid state
  # @param [String] rules
  # @param [Hash] current_state
  # @param [Hash] event
  # @return [Hash] next_state
  def next_state

    current_state = GridState.from_grid_array(params[:current_state])

    test_event = {
                  :type => "click",
                  :data => { :x => 2, :y => 3 }
                }

    LightsOutRuleEngine.next_state_for(current_state, test_event)

    respond_to do |format|
      format.json  { render :json => { :rules => 'lights_out',
                                       :next_state => current_state,
                                       :event => test_event # LightsOutRuleEngine.default_state
                                     }
      }
    end
  end
  # test manually with:
  # curl -i -X POST -H "Content-Type: application/json" -d '{"current_state":[[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,3,0],[0,0,0,0,5]], "event":{"type":"click","data":{"x":"2","y","3"}}}' http://localhost:3000/rules_engine/lights_out

  # GET by page index
  def name
    render :json => { :rules => 'lights_out'
           }
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/rules_engine/name


end  # document controller