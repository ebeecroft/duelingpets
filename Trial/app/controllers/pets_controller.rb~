class PetsController < ApplicationController
   # GET /pets
   # GET /pets.json

   def monsters
      #Finds the current user
      if current_user
         @user = current_user
         @mypets=[]      
         @selectpet = 1 #Makes the fight work
         @pet = Pet.find_by_id(params[:pet_id])
         #This is my way of doing things in a C++ fashion, I don't get all ruby things
         @user.petowners.each do |pet|
           #@selectpet2 = (params[:petowner][:id])
           #@selected_pet = pet.find(params[:selected])
       #   if pet.hp != 0
       #      @pets_kept << pet #Dont recall seeing the << before in ruby but for C++ statement used for cout statements
             #if pet.select
             #   @selected_pet = pet.select
             #end
         end
         @mypets = current_user.petowners.select{|pet| pet.hp !=0}
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
      if current_user && current_user.admin?
         @pets = Pet.all
      else
         redirect_to root_url
      end
   end

   def deny
      if current_user && current_user.admin?
         @pet = Pet.find_by_id(params[:pet_id])
         #send_email_to user that pet has been denied and be able to resend it
         redirect_to pets_reviews_url
      else
         redirect_to root_url
      end
   end

   def approve
      if current_user && current_user.admin?
         @pet = Pet.find_by_id(params[:pet_id])
         @pet.reviewed = true
         @pet.update_attributes(params[:pet])
         redirect_to pets_reviews_url
      else
         redirect_to root_url
      end
   end

   def index
      @count = 0
      @count2 = 0
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
      #flash[:success]
      @invalid = 0

      if @pet.hp < 10 || @pet.atk < 5 || @pet.def < 5 || @pet.spd < 5
         if @pet.hp < 10
            @invalid = 1
            flash[:notice] = "HP is lower then the minimum of 10 please correct" #{@contact.name}.
         end

         if @pet.atk < 5 && @invalid!=1
            @invalid = 1
            flash[:notice] = "ATK is lower then the minimum of 5 please correct"
         end

         if @pet.def < 5 && @invalid!=1
            @invalid = 1
            flash[:notice] = "DEF is lower then the minimum of 5 please correct"
         end

         if @pet.spd < 5 && @invalid!=1
            @invalid = 1
            flash[:notice] = "SPD is lower then the minimum of 5 please correct"
         end

         render "new"
         return
      end

      #    @pet.cost = (1+(@pet.hp/10) + (@pet.atk/5) + (@pet.def/5) + (@pet.spd/5))*10
      health = @pet.hp
      attack = @pet.atk
      defense = @pet.def
      speed = @pet.spd

      #Sends the Ruby data into the C++ calc program and retrieves the result
      results = `calc/calc #{health} #{attack} #{defense} #{speed}`
      string_array = results.split(",")
      r_cost, r_level = string_array.map { |str| str.to_i }

      @pet.cost = r_cost
      @pet.level = r_level
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
