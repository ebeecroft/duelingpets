class FightsController < ApplicationController
  # GET /fights
  # GET /fights.json
#  def attack
#     require 'socket'  
#     streamSock = TCPSocket.new( "127.0.0.1", 3000 )  
     #streamSock.send( "Hello\n" )  
#     str = streamSock.recv( 100 )  
#     print str  
#     streamSock.close
#  end

#  def calcdamage
#     @petowner = Petowner.find_by_id(params[:petowner_id])
#     @mdamage = ((@pet + 3)/(@petowner.def**0.5)+@pet.level**0.7)
#  end

     def runner
     #Collets information to be sent to C++ program
     @user = User.find_by_vname(current_user.vname)
     @pouch = Pouch.find_by_id(@user.id)
     @fight = Fight.find_by_id(params[:id])
     @petowner = Petowner.find_by_id(@fight.petowner_id)
     p_level = @petowner.level
     p_atk = @petowner.atk
     p_def = @petowner.def
     p_spd = @petowner.spd
     p_hp = @petowner.hp #this one
     p_maxhp = @petowner.hp_max
     p_exp = @petowner.exp
     coins = 0
     p_damage = 0
     m_damage = 0
     m_level = @fight.pet.level
     m_def = @fight.pet.def
     m_atk = @fight.pet.atk
     m_spd = @fight.pet.spd
     m_hp = @fight.monster_current_hp #this one
     #m_hp = 1

     puts '*'*50
     puts '*'*50

     #Global variables for hp
     global_monster_hp = @fight.monster_current_hp
     global_pet_hp = @petowner.hp

     if p_hp > 0 && m_hp > 0
        #Inputs data into the C++ program
        results = `formulas/formula #{p_level} #{p_atk} #{p_def} #{p_spd} #{p_hp} #{p_maxhp} #{p_exp} #{coins} #{p_damage} #{m_damage} #{m_level} #{m_def} #{m_atk} #{m_spd} #{m_hp}`

        #Retrieves the data from the C++ program
        string_array = results.split(",")

        #Stores the data in the following variables as ints
        c_p_damage, c_m_damage = string_array.map { |str| str.to_i }

        #Display the formula information that is entered
        puts "formula function returned #{results}"

        #Display the damage that pet did or not
        if c_p_damage != 0   
           puts "pet damage = #{c_p_damage}"
           mhp_now = 0
           #Sets the current hp remaining after damage is taken
           if @fight.monster_current_hp > c_p_damage
              mhp_now = @fight.monster_current_hp - c_p_damage
           end
           @fight.monster_current_hp = mhp_now
           global_monster_hp = mhp_now
        else
           puts "The pets attack missed!"
        end

        #Displays damage that monster did or not
        if c_m_damage !=0
           puts "monster damage = #{c_m_damage}"
           php_now = 0
           #Sets the current hp remaining after damage is taken
           if @fight.petowner.hp > c_m_damage
              php_now = @fight.petowner.hp - c_m_damage
           end
           global_pet_hp = php_now
           @petowner.hp = php_now
        else
           puts "The monsters attack missed!"
        end
     end

     #Display the remaining hp from the current fight
     puts "monster hp is now = #{global_monster_hp}"
     puts "pet hp is now = #{global_pet_hp}"

     #Calls the end battle function if hp of pet or monster is zero
     if global_pet_hp == 0 || global_monster_hp == 0
        #Inputs data into the C++ program
        p_hp = global_pet_hp
        m_hp = global_monster_hp
        results = `formulas/formula #{p_level} #{p_atk} #{p_def} #{p_spd} #{p_hp} #{p_maxhp} #{p_exp} #{coins} #{p_damage} #{m_damage} #{m_level} #{m_def} #{m_atk} #{m_spd} #{m_hp}`

        #Retrieves the data from the C++ program
        string_array = results.split(",")

        #Stores the data as ints in the given variables
        c_p_hp, c_p_maxhp, c_p_atk, c_p_def, c_p_spd, c_p_level, c_p_exp, c_coins = string_array.map { |str| str.to_i }

        #Display the formula information that is entered
        puts "formula function returned #{results}"

        #Battle Results
        if p_hp == 0 && m_hp == 0
          puts "Battle was a draw"
        elsif p_hp > 0 && m_hp == 0
          puts "The pet won the battle!"
        elsif p_hp == 0 && m_hp > 0
          puts "The monster won the battle!"
        else
          raise "Something went wrong with the battle results!"
        end

        #Display the results
        if c_p_level > p_level
           puts "pet level now = #{c_p_level}"
           @petowner.level = c_p_level
        end
        if c_p_atk > p_atk
           puts "pet attack now = #{c_p_atk}"
           @petowner.atk = c_p_atk
        end
        if c_p_def > p_def
           puts "pet defense now = #{c_p_def}"
           @petowner.def = c_p_def
        end
        if c_p_spd > p_spd
           puts "pet speed now = #{c_p_spd}"
           @petowner.spd = c_p_spd
        end
        if c_p_hp > p_hp
           puts "pet hp now = #{c_p_hp}"
           @petowner.hp = c_p_hp
        end
        if c_p_maxhp > p_maxhp
           puts "pet maxhp now = #{c_p_maxhp}"
           @petowner.hp_max = c_p_maxhp
        end
        if c_p_exp > 0
           puts "Your pet gained #{c_p_exp} points of experience!"
           @petowner.exp += c_p_exp
        end
        if c_coins > 0
           puts "You found #{c_coins} coins!"
           @pouch.amount += c_coins
           @pouch.save
        end
     end

     #Update petowners status by calling save on petowner
     if !@petowner.save
        raise "Petowner couldn't have stats saved"
     end

     #Update monsters status by calling save on fight
     if !@fight.save
        raise "Monster couldn't have stats saved"
     end
     
     #raise "I am here"
     #Redirect to the current fight or redirect to the root path
     if global_pet_hp == 0 || global_monster_hp == 0
        redirect_to root_url
     else
        redirect_to petowner_fight_url
     end
    end
  def index
#     @pets = Pet.all
     @petowner = Petowner.find_by_id(params[:petowner_id])
     @fights = @petowner.fights.all
#    @fights = Fight.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fights }
    end
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
    @petowner = Petowner.find_by_id(params[:petowner_id])
    #@pet = Pet.find_by_id(params[:pet_id])
    @fight = Fight.find(params[:id])
    @pet = Pet.find_by_id(params[:pet_id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fight }
    end
  end

  # GET /fights/new
  # GET /fights/new.json
  def new
#    @fight = Fight.new
     @petowner = Petowner.find_by_id(params[:petowner_id])
     @pet = Pet.find_by_id(params[:pet_id])
#     raise "I am error"
     if @pet.nil?
        raise "You are a really dumb user"
     end
     #if @petowner.nil?
     #   raise "there is no petowner here"
     #end
     @fight = @petowner.fights.build
     @fight.pet_id = @pet.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fight }
    end
  end

  # GET /fights/1/edit
  def edit
    @petowner = Petowner.find_by_id(params[:petowner_id])
    @fight = Fight.find(params[:id])
  end

  # POST /fights
  # POST /fights.json
  def create
#    @fight = Fight.new(params[:fight])
     @petowner = Petowner.find_by_id(params[:petowner_id])
     #@fight = @petowner.fights.new(params[:fight])
     @pet = Pet.find_by_id(params[:pet_id])
     @fight = @petowner.fights.build
     if @pet
     @fight.pet_id = @pet.id
     @fight.monster_current_hp = @pet.hp
     else
        raise "You are a really dumb user"
     end
      if @fight.save
        redirect_to petowner_fights_path(@petowner)
      else
        render "new"
      end
  end

  # PUT /fights/1
  # PUT /fights/1.json
  def update
    @petowner = Petowner.find_by_id(params[:petowner_id])
    @fight = Fight.find(params[:id])

      if @fight.update_attributes(params[:fight])
#        redirect_to petowner_fight_path(@petowner, @fight), notice: 'Fight was successfully updated.'
      else
#        render action: "edit" 
      end
      redirect_to petowner_fight_path(@petowner, @fight)
  end

  # DELETE /fights/1
  # DELETE /fights/1.json
  def destroy
    @petowner = Petowner.find_by_id(params[:petowner_id])
    @fight = Fight.find(params[:id])
    @fight.destroy

    respond_to do |format|
      format.html { redirect_to petowner_fights_url }
      format.json { head :no_content }
    end
  end
end
