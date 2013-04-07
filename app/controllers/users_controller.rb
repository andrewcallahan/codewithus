class UsersController < ApplicationController
  skip_before_filter :login_required, :only => ["new", "create"]


  # GET /users
  # GET /users.json
  def index
    @users = User.all

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

  def new_from_facebook
    @user = current_user
  end

  def create_from_facebook
    @user = current_user
    @user.password_digest = params[:password_digest]
    @user.save
    redirect_to root_url
  end

  def facebook_auth
    user = User.from_facebook_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to finish_account_signup_path
  end

end