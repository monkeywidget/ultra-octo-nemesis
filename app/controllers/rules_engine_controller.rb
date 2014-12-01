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
    respond_to do |format|
      format.json  { render :json => { :rules => 'lights_out',
                                       :next_state => LightsOutRuleEngine.hello,
                                       :return_param_one => params[:foo]
                                     }
      }
    end
  end
  # test manually with:
  #   $ curl -i -X POST -H "Content-Type: application/json" -d '{"foo":"bar","baz":"garply"}' http://localhost:3000/rules_engine/lights_out
  #

  # GET by page index
  def name
    render :json => { :rules => 'lights_out'
           }
  end
  # test manually with:
  #   curl -i -X GET -H "Content-Type: application/json" http://localhost:3000/rules_engine/name


end  # document controller