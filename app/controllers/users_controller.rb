class UsersController < ApplicationController
  skip_before_filter :login_required, :only => ["new", "create", "facebook_auth"]


  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def edit
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    params[:user_skillcategory].each do |skill, level|
      skill = Skillcategory.find_by_name(skill)
      user_skill = @user.user_skillcategories.find_or_create_by_skillcategory_id(skill.id)
      user_skill.level = level
      user_skill.save
    end

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), :notice => "Profile updated!" }
        format.json { render json: @users }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :notice => "Sorry, your profile could not be updated."}
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    @user.cell = @user.cell.gsub("-","").gsub(".","").gsub("(","").gsub(")","").gsub(" ","")

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to new_user_user_skillcategory_path(@user), notice: 'Now add your skills!' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new_from_facebook
    @user = current_user
  end

  def create_from_facebook
    if @user_exists = User.where(:email => params[:user][:email]).first
      @user_exists.copy_identity_data(current_user)
      current_user.delete
      session[:user_id] = @user_exists.id
      @user_exists.update_attributes(params[:user])
    else
      @user = current_user
      @user.update_attributes(params[:user])
      redirect_to root_url
    end
  end

  def facebook_auth
    auth_hash = request.env['omniauth.auth']
    user = User.from_facebook_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to finish_account_signup_path
  end

end