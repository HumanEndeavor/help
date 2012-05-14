class AcceptorsController < ApplicationController
  # GET /acceptors
  # GET /acceptors.json
  def index
    @acceptors = Acceptor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @acceptors }
    end
  end

  # GET /acceptors/1
  # GET /acceptors/1.json
  def show
    @acceptor = Acceptor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @acceptor }
    end
  end

  # GET /acceptors/new
  # GET /acceptors/new.json
  def new
    @acceptor = Acceptor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @acceptor }
    end
  end

  # GET /acceptors/1/edit
  def edit
    @acceptor = Acceptor.find(params[:id])
  end

  # POST /acceptors
  # POST /acceptors.json
  def create
    @acceptor = Acceptor.new(params[:acceptor])

    respond_to do |format|
      if @acceptor.save
        format.html { redirect_to @acceptor, notice: 'Acceptor was successfully created.' }
        format.json { render json: @acceptor, status: :created, location: @acceptor }
      else
        format.html { render action: "new" }
        format.json { render json: @acceptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /acceptors/1
  # PUT /acceptors/1.json
  def update
    @acceptor = Acceptor.find(params[:id])

    respond_to do |format|
      if @acceptor.update_attributes(params[:acceptor])
        format.html { redirect_to @acceptor, notice: 'Acceptor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @acceptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acceptors/1
  # DELETE /acceptors/1.json
  def destroy
    @acceptor = Acceptor.find(params[:id])
    @acceptor.destroy

    respond_to do |format|
      format.html { redirect_to acceptors_url }
      format.json { head :ok }
    end
  end
end
