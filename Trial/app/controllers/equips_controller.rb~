class EquipsController < ApplicationController
  # GET /equips
  # GET /equips.json
  def index
#    @user = User.find_by_vname(params[:user_id])
#    @petowners = @user.petowners.all
#    @equips = Equip.all
     @petowner = Petowner.find_by_id(params[:petowner_id])
     @equips = @petowner.equips.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @equips }
    end
  end

  # GET /equips/1
  # GET /equips/1.json
  def show
    @equip = Equip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @equip }
    end
  end

  # GET /equips/new
  # GET /equips/new.json
  def new
#    @equip = Equip.new
    @petowner = Petowner.find_by_id(params[:petowner_id])
    @equip = @petowner.equips.build
    @equip.inventory_id = params[:inventory_id]   
  end

  # GET /equips/1/edit
  def edit
    @equip = Equip.find(params[:id])
  end

  # POST /equips
  # POST /equips.json
  def create
#    @equip = Equip.new(params[:equip])
     @petowner = Petowner.find_by_id(params[:petowner_id])
     @equip = @petowner.equips.new(params[:equip])
      if @equip.save
        redirect_to petowner_equips_path(@petowner)
      else
        render "new"
      end
  end

  # PUT /equips/1
  # PUT /equips/1.json
  def update
    @equip = Equip.find(params[:id])

    respond_to do |format|
      if @equip.update_attributes(params[:equip])
        format.html { redirect_to @equip, notice: 'Equip was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equips/1
  # DELETE /equips/1.json
  def destroy
    @equip = Equip.find(params[:id])
    @equip.destroy

    respond_to do |format|
      format.html { redirect_to equips_url }
      format.json { head :no_content }
    end
  end
end
