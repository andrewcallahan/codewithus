class ParticipantsController < ApplicationController

  def create 
    @participant = Participant.new
    @hackathon = Hackathon.find(params[:participant][:hackathon_id])
    @participant.user_id = current_user.id
    @participant.hackathon_id = @hackathon.id

     respond_to do |format|
       if @participant.save
         format.html { redirect_to new_hackathon_team_path(@hackathon), notice: "You've joined the hackathon!" }
         format.json { render json: @participant, status: :created, location: @hackathon }
       else
         format.html { render action: "new" }
         format.json { render json: @participant.errors, status: :unprocessable_entity }
       end
     end
  end

end