class GchaptersController < ApplicationController
  # GET /gchapters
  # GET /gchapters.json
  def index
    @gchapters = Gchapter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gchapters }
    end
  end

  # GET /gchapters/1
  # GET /gchapters/1.json
  def show
    @gchapter = Gchapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gchapter }
    end
  end

  # GET /gchapters/new
  # GET /gchapters/new.json
  def new
    @gchapter = Gchapter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gchapter }
    end
  end

  # GET /gchapters/1/edit
  def edit
    @gchapter = Gchapter.find(params[:id])
  end

  # POST /gchapters
  # POST /gchapters.json
  def create
    @gchapter = Gchapter.new(params[:gchapter])

    respond_to do |format|
      if @gchapter.save
        format.html { redirect_to @gchapter, notice: 'Gchapter was successfully created.' }
        format.json { render json: @gchapter, status: :created, location: @gchapter }
      else
        format.html { render action: "new" }
        format.json { render json: @gchapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gchapters/1
  # PUT /gchapters/1.json
  def update
    @gchapter = Gchapter.find(params[:id])

    respond_to do |format|
      if @gchapter.update_attributes(params[:gchapter])
        format.html { redirect_to @gchapter, notice: 'Gchapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gchapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gchapters/1
  # DELETE /gchapters/1.json
  def destroy
    @gchapter = Gchapter.find(params[:id])
    @gchapter.destroy

    respond_to do |format|
      format.html { redirect_to gchapters_url }
      format.json { head :no_content }
    end
  end
end
