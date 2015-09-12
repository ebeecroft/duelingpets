class MaintenancemodesController < ApplicationController
  # GET /maintenancemodes
  # GET /maintenancemodes.json
  def index
    @maintenancemodes = Maintenancemode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintenancemodes }
    end
  end

  # GET /maintenancemodes/1
  # GET /maintenancemodes/1.json
  def show
    @maintenancemode = Maintenancemode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maintenancemode }
    end
  end

  # GET /maintenancemodes/new
  # GET /maintenancemodes/new.json
  def new
    @maintenancemode = Maintenancemode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maintenancemode }
    end
  end

  # GET /maintenancemodes/1/edit
  def edit
    @maintenancemode = Maintenancemode.find(params[:id])
  end

  # POST /maintenancemodes
  # POST /maintenancemodes.json
  def create
    @maintenancemode = Maintenancemode.new(params[:maintenancemode])

    respond_to do |format|
      if @maintenancemode.save
        format.html { redirect_to @maintenancemode, notice: 'Maintenancemode was successfully created.' }
        format.json { render json: @maintenancemode, status: :created, location: @maintenancemode }
      else
        format.html { render action: "new" }
        format.json { render json: @maintenancemode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maintenancemodes/1
  # PUT /maintenancemodes/1.json
  def update
    @maintenancemode = Maintenancemode.find(params[:id])

    respond_to do |format|
      if @maintenancemode.update_attributes(params[:maintenancemode])
        format.html { redirect_to @maintenancemode, notice: 'Maintenancemode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maintenancemode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenancemodes/1
  # DELETE /maintenancemodes/1.json
  def destroy
    @maintenancemode = Maintenancemode.find(params[:id])
    @maintenancemode.destroy

    respond_to do |format|
      format.html { redirect_to maintenancemodes_url }
      format.json { head :no_content }
    end
  end
end
