class PetownersController < ApplicationController
  # GET /petowners
  # GET /petowners.json
  def index
    @petowners = Petowner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @petowners }
    end
  end

  # GET /petowners/1
  # GET /petowners/1.json
  def show
    @petowner = Petowner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @petowner }
    end
  end

  # GET /petowners/new
  # GET /petowners/new.json
  def new
    @petowner = Petowner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @petowner }
    end
  end

  # GET /petowners/1/edit
  def edit
    @petowner = Petowner.find(params[:id])
  end

  # POST /petowners
  # POST /petowners.json
  def create
     @user = User.find(params[:user_id])
     @petowner = @user.petowners.build
#     @petowner = Petowner.new(params[:petowner])
     @pet = Pet.find(params[:pet][:pet_id])
     @petowner.pet = @pet

    respond_to do |format|
      if @petowner.save
#        format.html { redirect_to @petowner, notice: 'Petowner was successfully created.' }
#        format.json { render json: @petowner, status: :created, location: @petowner }
      else
        format.html { render action: "new" }
        format.json { render json: @petowner.errors, status: :unprocessable_entity }
      end
      redirect_to @user
    end
  end

  # PUT /petowners/1
  # PUT /petowners/1.json
  def update
    @petowner = Petowner.find(params[:id])

    respond_to do |format|
      if @petowner.update_attributes(params[:petowner])
        format.html { redirect_to @petowner, notice: 'Petowner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @petowner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petowners/1
  # DELETE /petowners/1.json
  def destroy
    @petowner = Petowner.find(params[:id])
    @petowner.destroy

    respond_to do |format|
      format.html { redirect_to petowners_url }
      format.json { head :no_content }
    end
  end
end
