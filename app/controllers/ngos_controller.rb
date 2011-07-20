class NgosController < ApplicationController
  def states
    state_id = Ngo.find(params['ngo']).state_id
    @states = State.find(state_id)
    render :partial => 'states', :layout => false
  end
end
