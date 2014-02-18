class FightsController < ApplicationController
  # GET /fights
  # GET /fights.json
  
  def list
     @fights = Fight.all
  end

     def runner
     #Collets information to be sent to C++ program
     modified_atk = 0
     modified_def = 0
     modified_spd = 0
     @user = User.find_by_vname(current_user.vname)
     @pouch = Pouch.find_by_id(@user.id)
     @fight = Fight.find_by_id(params[:id])
     @petowner = Petowner.find_by_id(@fight.petowner_id)
     @equips = @petowner.equips.all
     @equips.each do |equip|
        modified_atk += equip.inventory.item.atk
        modified_def += equip.inventory.item.def
        modified_spd += equip.inventory.item.spd
     end

     #Base pet stats
     pet_attack = @petowner.atk
     pet_defense = @petowner.def
     pet_speed = @petowner.spd

     #Total stats of the pet
     total_atk = pet_attack + modified_atk
     total_def = pet_defense + modified_def
     total_spd = pet_speed + modified_spd

     #Set pet stats
     p_level = @petowner.level
     p_atk = total_atk
     p_def = total_def
     p_spd = total_spd
     p_hp = @petowner.hp #this one
     p_maxhp = @petowner.hp_max
     p_exp = @petowner.exp
     
     #Damage and coins
     coins = 0
     p_damage = 0
     m_damage = 0

     #Set the monsters stats
     m_level = @fight.pet.level
     m_def = @fight.pet.def
     m_atk = @fight.pet.atk
     m_spd = @fight.pet.spd
     m_hp = @fight.mhp #this one

     puts '*'*50
     puts '*'*50

     #Global variables for hp
     global_monster_hp = @fight.mhp
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
           if @fight.mhp > c_p_damage
              mhp_now = @fight.mhp - c_p_damage
           end
           @fight.mhp = mhp_now
           global_monster_hp = mhp_now
           @fight.pdamage = c_p_damage
        else
           puts "The pets attack missed!"
           @fight.pdamage = c_p_damage
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
           @fight.mdamage = c_m_damage
        else
           puts "The monsters attack missed!"
           @fight.mdamage = 0
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
        p_atk = total_atk - modified_atk
        p_def = total_def - modified_def
        p_spd = total_spd - modified_spd

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
           expgainlol = c_p_exp-@petowner.exp
           puts "Your pet gained #{expgainlol} points of experience!"
           @petowner.exp = c_p_exp
        end
        if c_coins > 0
           puts "You found #{c_coins} coins!"
           @fight.coins = c_coins
           @pouch.amount += c_coins
           @pouch.save
        end
        @fight.battle_done = true
        @petowner.in_battle = false
     end

     #Update petowners status by calling save on petowner
     if !@petowner.save
        raise "Petowner couldn't have stats saved"
     end

     #Update monsters status by calling save on fight
     if !@fight.save
        raise "Monster couldn't have stats saved"
     end
     
     #Redirect to the current fight or redirect to the root path
     if global_pet_hp == 0 || global_monster_hp == 0
        redirect_to root_url
     else
        redirect_to petowner_fight_url
     end
    end
  def index
     @petowner = Petowner.find_by_id(params[:petowner_id])
     @fights = @petowner.fights.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fights }
    end
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
    @petowner = Petowner.find_by_id(params[:petowner_id])
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
     @petowner = Petowner.find_by_id(params[:petowner_id])
     @pet = Pet.find_by_id(params[:pet_id])
@selectpet = params[:pickpet][:petoid]
     if @pet.nil?
        raise "You are a really dumb user"
     end

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
     @selectpet = params[:pickpet][:petoid]
     @petowner = Petowner.find_by_id(params[:pickpet][:petoid])
     @pet = Pet.find_by_id(params[:pet_id])
     @fight = @petowner.fights.build
     if @pet  
       @fight.pet_id = @pet.id
       @fight.mhp = @pet.hp
       @petowner.in_battle = true
     else
        raise "You are a really dumb user"
     end

      if @fight.save
        @petowner.save
        redirect_to petowner_fight_path(@petowner, @fight)
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
