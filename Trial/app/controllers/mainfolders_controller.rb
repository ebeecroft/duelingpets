class MainfoldersController < ApplicationController
  # GET /mainfolders
  # GET /mainfolders.json
  def index
    @mainfolders = Mainfolder.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mainfolders }
    end
  end

  # GET /mainfolders/1
  # GET /mainfolders/1.json
  def show
    @mainfolder = Mainfolder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mainfolder }
    end
  end

  # GET /mainfolders/new
  # GET /mainfolders/new.json
  def new
    @mainfolder = Mainfolder.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mainfolder }
    end
  end

  # GET /mainfolders/1/edit
  def edit
    @mainfolder = Mainfolder.find(params[:id])
  end

  # POST /mainfolders
  # POST /mainfolders.json
  def create
    @mainfolder = Mainfolder.new(params[:mainfolder])

    respond_to do |format|
      if @mainfolder.save
        format.html { redirect_to @mainfolder, notice: 'Mainfolder was successfully created.' }
        format.json { render json: @mainfolder, status: :created, location: @mainfolder }
      else
        format.html { render action: "new" }
        format.json { render json: @mainfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mainfolders/1
  # PUT /mainfolders/1.json
  def update
    @mainfolder = Mainfolder.find(params[:id])

    respond_to do |format|
      if @mainfolder.update_attributes(params[:mainfolder])
        format.html { redirect_to @mainfolder, notice: 'Mainfolder was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mainfolder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mainfolders/1
  # DELETE /mainfolders/1.json
  def destroy
    @mainfolder = Mainfolder.find(params[:id])
    @mainfolder.destroy

    respond_to do |format|
      format.html { redirect_to mainfolders_url }
      format.json { head :no_content }
    end
  end
end
