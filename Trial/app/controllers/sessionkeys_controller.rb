class SessionkeysController < ApplicationController
  # GET /sessionkeys
  # GET /sessionkeys.json
  def index
    @sessionkeys = Sessionkey.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessionkeys }
    end
  end

  # GET /sessionkeys/1
  # GET /sessionkeys/1.json
  def show
    @sessionkey = Sessionkey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sessionkey }
    end
  end

  # GET /sessionkeys/new
  # GET /sessionkeys/new.json
  def new
    @sessionkey = Sessionkey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sessionkey }
    end
  end

  # GET /sessionkeys/1/edit
  def edit
    @sessionkey = Sessionkey.find(params[:id])
  end

  # POST /sessionkeys
  # POST /sessionkeys.json
  def create
    @sessionkey = Sessionkey.new(params[:sessionkey])

    respond_to do |format|
      if @sessionkey.save
        format.html { redirect_to @sessionkey, notice: 'Sessionkey was successfully created.' }
        format.json { render json: @sessionkey, status: :created, location: @sessionkey }
      else
        format.html { render action: "new" }
        format.json { render json: @sessionkey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sessionkeys/1
  # PUT /sessionkeys/1.json
  def update
    @sessionkey = Sessionkey.find(params[:id])

    respond_to do |format|
      if @sessionkey.update_attributes(params[:sessionkey])
        format.html { redirect_to @sessionkey, notice: 'Sessionkey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sessionkey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessionkeys/1
  # DELETE /sessionkeys/1.json
  def destroy
    @sessionkey = Sessionkey.find(params[:id])
    @sessionkey.destroy

    respond_to do |format|
      format.html { redirect_to sessionkeys_url }
      format.json { head :no_content }
    end
  end
end
