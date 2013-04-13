class UserSkillcategoriesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @user_skillcategory = UserSkillcategory.new

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user_skillcategory = UserSkillcategory.find(params[:user_id])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def create
    @user = User.find(params[:user_id])
    params[:user_skillcategory].each do |skill, level|
      user_skillcategory = @user.user_skillcategories.build(:user_id => params[:user_id])
      category = Skillcategory.where(:name => skill).first
      user_skillcategory.skillcategory_id = category.id
      user_skillcategory.level = level.to_i
      user_skillcategory.save
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Skills added!' }
      else
        format.html { render action: "edit" } 
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_url, notice: "Your stars are traveling through space to get here. Refresh your page in a few seconds!" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

end
