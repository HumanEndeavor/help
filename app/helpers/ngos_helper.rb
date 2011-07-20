module NgosHelper
  def options_for_states states
    if states.kind_of?(Array)
    states.collect{|state| [state.name,state.id]}
    else
      state = []
      state << [states.name]
      state.first
    end
  end
end
