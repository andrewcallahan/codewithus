class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.where(:hackathon_id => params[:hackathon_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new
    @potential_teammates = Hackathon.find(params[:hackathon_id]).load_potential_teammates(current_user)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
    @current_teammates = @team.teammates.collect { |teammate| User.find(teammate.user_id) }
    @potential_teammates = Hackathon.find(params[:hackathon_id]).load_potential_teammates(current_user)
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(:name => params[:team][:name])
    hackathon = Hackathon.find(params[:hackathon_id])
    @team.hackathon_id = hackathon.id
    @team.creator_id = current_user.id
    @team.project = params[:team][:project] unless params[:team][:project] = ""
    
    params[:teammates].uniq.each do |user_id|
      new_teammate = @team.teammates.build(:user_id => user_id)
    end
    respond_to do |format|
      if @team.save
        @team.teammates.create(:user_id => current_user.id, :team_id => @team.id)
        format.html { redirect_to hackathon_path(hackathon), notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
