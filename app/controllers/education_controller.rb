class EducationController < ApplicationController
  def index
    @ngos = Ngo.where(:category_id => 1)
    @states = State.all
  end
end
