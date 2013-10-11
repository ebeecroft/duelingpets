class EquipsController < ApplicationController
  # GET /equips
  # GET /equips.json
  def index
    @equips = Equip.all

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
    @equip = Equip.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equip }
    end
  end

  # GET /equips/1/edit
  def edit
    @equip = Equip.find(params[:id])
  end

  # POST /equips
  # POST /equips.json
  def create
    @equip = Equip.new(params[:equip])

    respond_to do |format|
      if @equip.save
        format.html { redirect_to @equip, notice: 'Equip was successfully created.' }
        format.json { render json: @equip, status: :created, location: @equip }
      else
        format.html { render action: "new" }
        format.json { render json: @equip.errors, status: :unprocessable_entity }
      end
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
