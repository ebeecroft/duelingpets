class UsertypesController < ApplicationController
  # GET /usertypes
  # GET /usertypes.json
  def index
    @usertypes = Usertype.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usertypes }
    end
  end

  # GET /usertypes/1
  # GET /usertypes/1.json
  def show
    @usertype = Usertype.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usertype }
    end
  end

  # GET /usertypes/new
  # GET /usertypes/new.json
  def new
    @usertype = Usertype.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usertype }
    end
  end

  # GET /usertypes/1/edit
  def edit
    @usertype = Usertype.find(params[:id])
  end

  # POST /usertypes
  # POST /usertypes.json
  def create
    @usertype = Usertype.new(params[:usertype])

    respond_to do |format|
      if @usertype.save
        format.html { redirect_to @usertype, notice: 'Usertype was successfully created.' }
        format.json { render json: @usertype, status: :created, location: @usertype }
      else
        format.html { render action: "new" }
        format.json { render json: @usertype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /usertypes/1
  # PUT /usertypes/1.json
  def update
    @usertype = Usertype.find(params[:id])

    respond_to do |format|
      if @usertype.update_attributes(params[:usertype])
        format.html { redirect_to @usertype, notice: 'Usertype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usertype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usertypes/1
  # DELETE /usertypes/1.json
  def destroy
    @usertype = Usertype.find(params[:id])
    @usertype.destroy

    respond_to do |format|
      format.html { redirect_to usertypes_url }
      format.json { head :no_content }
    end
  end
end
