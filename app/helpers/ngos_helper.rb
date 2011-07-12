module NgosHelper
  def options_for_states states
    states.collect{|state| [state.name,state.id]}
  end
end
