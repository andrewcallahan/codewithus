class TeammatesController < ApplicationController
  # GET /teammates
  # GET /teammates.json
  def index
    @teammates = Teammate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teammates }
    end
  end

  # GET /teammates/1
  # GET /teammates/1.json
  def show
    @teammate = Teammate.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teammate }
    end
  end

  # GET /teammates/new
  # GET /teammates/new.json
  def new
    @teammate = Teammate.new
    @teams = Hackathon.find(params[:hackathon_id]).teams

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teammate }
    end
  end

  # GET /teammates/1/edit
  def edit
    @teammate = Teammate.find(params[:id])
  end

  # POST /teammates
  # POST /teammates.json
  def create
    @teammate = Teammate.new
    @teammate.team_id = params[:id]
    @teammate.user_id = current_user.id

    respond_to do |format|
      if @teammate.save
        format.html { redirect_to hackathon_path(Hackathon.find(params[:hackathon_id])), notice: 'Teammate was successfully created.' }
        format.json { render json: @teammate, status: :created, location: @teammate }
      else
        format.html { render action: "new" }
        format.json { render json: @teammate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teammates/1
  # PUT /teammates/1.json
  def update
    @teammate = Teammate.find(params[:id])

    respond_to do |format|
      if @teammate.update_attributes(params[:teammate])
        format.html { redirect_to @teammate, notice: 'Teammate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teammate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teammates/1
  # DELETE /teammates/1.json
  def destroy
    @teammate = Teammate.find(params[:id])
    @teammate.destroy

    respond_to do |format|
      format.html { redirect_to teammates_url }
      format.json { head :no_content }
    end
  end
end
