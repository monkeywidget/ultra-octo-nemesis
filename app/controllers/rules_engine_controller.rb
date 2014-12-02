include LightsOutRuleEngine

class RulesEngineController < ApplicationController

  respond_to :json

  # POST to get the next state
  # JSON in: rules set name, current grid state, incoming event
  # JSON out: next grid state
  # @param [String] rules
  # @param [Hash] current_state
  #   like [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
  # @param [Hash] event
  #   like {"type":"click","data":{"x":1,"y":1}}
  # @return [Hash] next_state
  #   like {"rules":"lights_out","next_state":{"x_size":5,"y_size":5,"cells":[[0,1,0,0,0],[1,1,1,0,0],[0,1,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]}}
  def next_state

    current_state = LightsOutGridState.from_grid_array(params[:current_state])

    next_state = LightsOutRuleEngine.next_state_for(current_state, params[:event])

    respond_to do |format|
      format.json  { render :json => { :rules => params[:rules],
                                       :next_state => next_state
                                     }
      }
    end
  end
  # test manually with:
  # curl -i -X POST -H "Content-Type: application/json" -d '{"current_state":[[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]],"event":{"type":"click","data":{"x":1,"y":1}}}' http://localhost:3000/rules_engine/lights_out



  # GET by page index
  def name
    render :json => { :rules => 'lights_out'
           }
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/rules_engine/name


end  # document controller