require 'spec_helper'

describe EducationController do

  describe 'index' do
    get :index
    response should_be success
    
  end

  
  
end
