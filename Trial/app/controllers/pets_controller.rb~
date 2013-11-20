class PetsController < ApplicationController
  # GET /pets
  # GET /pets.json

  def monsters
    #Finds the current user
    if !current_user.nil?
    @user = User.find_by_vname(current_user.vname)

    #Find the petowners that the user currently has
    @mypets = @user.petowners
    end

    @pets = Pet.all
    @count = 0
    @pets.each do |pet|
      if pet.reviewed? && pet.monster?
         @count+=1
      end
    end
  end

  def reviews
     @pets = Pet.all
  end

  def deny
#    raise "I hit the deny place"
    @pet = Pet.find_by_id(params[:pet_id])
    #send_email_to user that pet has been denied and be able to resend it
    redirect_to pets_reviews_url
  end

  def approve
    @pet = Pet.find_by_id(params[:pet_id])
    @pet.inspect
#raise "I am here"
    @pet.reviewed = true
#    raise "I am here"
    @pet.update_attributes(params[:pet])
#    raise "I am here"
    redirect_to pets_reviews_url
  end

  def index
    @count = 0
    @pets = Pet.all
    @pets.each do |pet|
      if pet.reviewed?
         @count+=1
      end
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pets }
    end
  end

  # GET /pets/1
  # GET /pets/1.json
  def show
    
    @pet = Pet.find_by_species_name(params[:id])
    #@pet_owner.adopted_on = Date.today
    if !@pet.reviewed?
       redirect_to root_path
    end
  end

  # GET /pets/new
  # GET /pets/new.json
  def new
    @pet = Pet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet }
    end
  end

  # GET /pets/1/edit
  def edit
    @pet = Pet.find_by_species_name(params[:id])
  end

  # POST /pets
  # POST /pets.json
  def create
#@comment.author = current_user.vname
    @pet = Pet.new(params[:pet])
    @pet.created_on = Date.today
    @pet.created_by = current_user.vname
    respond_to do |format|
      if @pet.save
        format.html { redirect_to pets_url, notice: 'Pet was successfully created.' }
        format.json { render json: @pet, status: :created, location: @pet }
      else
        format.html { render action: "new" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pets/1
  # PUT /pets/1.json
  def update
        @pet = Pet.find_by_species_name(params[:id])

    respond_to do |format|
      if @pet.update_attributes(params[:pet])
        format.html { redirect_to @pet, notice: 'Pet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1
  # DELETE /pets/1.json
  def destroy
    @pet = Pet.find_by_species_name(params[:id])
    @pet.destroy

    respond_to do |format|
      format.html { redirect_to pets_url }
      format.json { head :no_content }
    end
  end
end
