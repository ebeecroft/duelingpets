class FightsController < ApplicationController
  # GET /fights
  # GET /fights.json
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
    @fight = Fight.find(params[:id])

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
     @fight.monster_id = params[:pet_id]

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
