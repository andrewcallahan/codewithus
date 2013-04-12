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
        format.html { redirect_to user_path(@user), notice: 'User was successfully created and logged in' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: "Your stars are traveling through space to get here. Refresh your page in a few seconds!" }
        format.json { head :no_content }
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