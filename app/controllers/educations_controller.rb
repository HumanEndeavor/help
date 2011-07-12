class EducationsController < ApplicationController
  def index
    @ngos = Ngo.where(:category_id => 1)
    @states = State.for_ngo(params[:ngo])
    @districts = District.for_state(params[:state])
  end

  def search
    @people = Person.search(params)
    render :text => @people.size
  end
end
