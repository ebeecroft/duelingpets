class SubfoldersController < ApplicationController
  # GET /subfolders
  # GET /subfolders.json
  def index
    @subfolders = Subfolder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subfolders }
    end
  end

  # GET /subfolders/1
  # GET /subfolders/1.json
  def show
    @subfolder = Subfolder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subfolder }
    end
  end

  # GET /subfolders/new
  # GET /subfolders/new.json
  def new
    @subfolder = Subfolder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subfolder }
    end
  end

  # GET /subfolders/1/edit
  def edit
    @subfolder = Subfolder.find(params[:id])
  end

  # POST /subfolders
  # POST /subfolders.json
  def create
    @subfolder = Subfolder.new(params[:subfolder])

    respond_to do |format|
      if @subfolder.save
        format.html { redirect_to @subfolder, notice: 'Subfolder was successfully created.' }
        format.json { render json: @subfolder, status: :created, location: @subfolder }
      else
        format.html { render action: "new" }
        format.json { render json: @subfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /subfolders/1
  # PUT /subfolders/1.json
  def update
    @subfolder = Subfolder.find(params[:id])

    respond_to do |format|
      if @subfolder.update_attributes(params[:subfolder])
        format.html { redirect_to @subfolder, notice: 'Subfolder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subfolders/1
  # DELETE /subfolders/1.json
  def destroy
    @subfolder = Subfolder.find(params[:id])
    @subfolder.destroy

    respond_to do |format|
      format.html { redirect_to subfolders_url }
      format.json { head :no_content }
    end
  end
end
