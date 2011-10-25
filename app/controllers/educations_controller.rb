class EducationsController < ApplicationController
  def index
    @ngos = Ngo.where(:category_id => 1)
    @states = State.for_ngo(params[:ngo])
    @districts = District.for_state(params[:state])
    @people = Person.all
    @json = Ngo.all.to_gmaps4rails
    respond_to do |format|
      format.html #{render :text => 'doel'}
    end
  end

  def search
    @people = Person.search(params)
    render :text => @people.size
  end
end
