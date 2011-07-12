class NgosController < ApplicationController
  def states
    logger.info "====================="
    logger.info Ngo.find(params['ngo']).states
    logger.info params.inspect
    @states = State.where(:ngo_id => params['ngo'])
    render :partial => 'states', :layout => false
  end
end
