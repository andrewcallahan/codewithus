class HackathonsController < ApplicationController

  # GET /users
  # GET /users.json
  def index
    @hackathons = Hackathon.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @hackathon = Hackathon.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
    # GET /stars/new
  # GET /stars/new.json
  def new
    @hackathon = Hackathon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hackathon }
    end
  end

  # GET /stars/1/edit
  def edit
    @hackathon = Hackathon.find(params[:id])
  end

  # POST /stars
  # POST /stars.json
  def create
    @hackathon = Hackathon.new(params[:star])

    respond_to do |format|
      if @hackathon.save
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully created.' }
        format.json { render json: @hackathon, status: :created, location: @hackathon }
      else
        format.html { render action: "new" }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stars/1
  # PUT /stars/1.json
  def update
    @hackathon = Hackathon.find(params[:id])

    respond_to do |format|
      if @hackathon.update_attributes(params[:star])
        format.html { redirect_to @hackathon, notice: 'Hackathon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hackathon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stars/1
  # DELETE /stars/1.json
  def destroy
    @hackathon = Hackathon.find(params[:id])
    @hackathon.destroy

    respond_to do |format|
      format.html { redirect_to stars_url }
      format.json { head :no_content }
    end
  end

end

