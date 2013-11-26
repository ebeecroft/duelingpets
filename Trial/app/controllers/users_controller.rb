class UsersController < ApplicationController
  require 'date'
  before_filter :signed_in_user, :only =>[:edit, :update]
  before_filter :correct_user, :only=>[:edit, :update]
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
    @user = User.find_by_vname(params[:id])

#    if @user.maintenance?
#       raise "I am in maintenance mode"
#    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    current_time = Date.today
    #start_time = current_time.strftime("%m/%d/%Y")
    #@user.joined_on = (Date.today.to_s.to_date)
    @user.joined_on = Date.today
      if @user.save
         sign_in @user
         flash[:success] = "Welcome to the Trial app"
         redirect_to @user
      else
         render "new"
      end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find_by_vname(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find_by_vname(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
     def signed_in_user
        redirect_to signin_path unless signed_in?
     end

     def correct_user
        @user = User.find_by_vname(params[:id])
        redirect_to root_path unless current_user?(@user)
     end
end
