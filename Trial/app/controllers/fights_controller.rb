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
     p_level = 1
     p_atk = 1
     p_def = 1
     p_spd = 4
     p_hp = 8
     p_maxhp = 10
     p_exp = 0
     coins = 0
     p_damage = 0
     m_damage = 0
     m_level = 1
     m_def = 1
     m_atk = 1
     m_spd = 1
     m_hp = 0

     #Inputs data into the C++ program
     results = `formulas/formula #{p_level} #{p_atk} #{p_def} #{p_spd} #{p_hp} #{p_maxhp} #{p_exp} #{coins} #{p_damage} #{m_damage} #{m_level} #{m_def} #{m_atk} #{m_spd} #{m_hp}`

puts '*'*50
puts '*'*50
puts "formula function returned #{results}"

     #Retrieves the data from the C++ program
     string_array = results.split(",")

     #Checks which battle function was run
     if string_array.length == 2
        #Stores the data in the following variables as ints
        c_p_damage, c_m_damage = string_array.map { |str| str.to_i }

        #Display the results
        if c_p_damage != 0   
           puts "pet damage = #{c_p_damage}"
        else
           puts "The pets attack missed!"
        end

        if c_m_damage !=0
           puts "monster damage = #{c_m_damage}"
        else
           puts "The monsters attack missed!"
        end

        #Update petowners status by calling save on petowner

        #Update monsters status by calling save on fight
     else
        #Stores the data in the following variables as ints
        c_p_hp, c_p_maxhp, c_p_atk, c_p_def, c_p_spd, c_p_level, c_p_exp, c_coins = string_array.map { |str| str.to_i }

        #Display the results
        puts "pet level now = #{c_p_level}"
        puts "pet attack now = #{c_p_atk}"
        puts "pet defense now = #{c_p_def}"
        puts "pet speed now = #{c_p_spd}"
        puts "pet hp now = #{c_p_hp}"
        puts "pet maxhp now = #{c_p_maxhp}" 
        puts "pet experience = #{c_p_exp}"
        puts "coins gained = #{c_coins}"
     end

     #raise "I am here"
     redirect_to home_url
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
#     raise "I am error"
     if @petowner.nil?
        raise "there is no petowner here"
     end
     @fight = @petowner.fights.build
     @fight.pet_id = params[:pet_id]

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
     @fight = @petowner.fights.new(params[:fight])
     @pet = Pet.find_by_id(@fight.pet_id)
     @fight.monster_current_hp = @pet.hp

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
