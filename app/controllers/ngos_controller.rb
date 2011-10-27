class NgosController < ApplicationController
  
  def states
    state_id = Ngo.find(params['ngo']).state_id
    @states = State.find(state_id)
    render :partial => 'states', :layout => false
  end
  
  # GET /ngos.json
  def index
    @ngos = Ngo.all
    @json = Ngo.all.to_gmaps4rails
    @categories = Category.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json => @ngos }
    end
  end

  # GET /ngos/1
  # GET /ngos/1.json
  def show
    @ngo = Ngo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json => @ngo }
    end
  end

  # GET /ngos/new
  # GET /ngos/new.json
  def new
    @ngo = Ngo.new
    @categories = Category.all
        Rails.logger.info "-------new--------#{@json.inspect}"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json => @ngo }
    end
  end

  # GET /ngos/1/edit
  def edit
    @ngo = Ngo.find(params[:id])
  end

  # POST /ngos
  # POST /ngos.json
  def create
    @ngo = Ngo.new(params[:ngo])
    Rails.logger.info "-------create--------#{@json.inspect}"
    respond_to do |format|
      if @ngo.save
        format.html { redirect_to @ngo, notice => 'Ngo was successfully created.' }
        format.json { render json => @ngo, status => :created, location => @ngo }
      else
        format.html { render action => "new" }
        format.json { render json => @ngo.errors, status => :unprocessable_entity }
      end
    end
  end

  # PUT /ngos/1
  # PUT /ngos/1.json
  def update
    @ngo = Ngo.find(params[:id])

    respond_to do |format|
      if @ngo.update_attributes(params[:ngo])
        format.html { redirect_to @ngo, notice => 'Ngo was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action => "edit" }
        format.json { render json => @ngo.errors, status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ngos/1
  # DELETE /ngos/1.json
  def destroy
    @ngo = Ngo.find(params[:id])
    @ngo.destroy

    respond_to do |format|
      format.html { redirect_to ngos_url }
      format.json { head :ok }
    end
  end

end
