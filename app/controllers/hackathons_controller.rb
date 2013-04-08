class HackathonsController < ApplicationController

  skip_before_filter :login_required, :only => ["index"]

  # GET /users
  # GET /users.json
  def index
    @hackathons = Hackathon.order("start ASC")
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @hackathon = Hackathon.find(params[:id])
    @participant= @hackathon.participants.build(:user_id => current_user.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hackathon }
    end
  end

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

  def create
    @hackathon = Hackathon.new(params[:hackathon])

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

  def destroy
    @hackathon = Hackathon.find(params[:id])
    @hackathon.destroy

    respond_to do |format|
      format.html { redirect_to stars_url }
      format.json { head :no_content }
    end
  end

end

