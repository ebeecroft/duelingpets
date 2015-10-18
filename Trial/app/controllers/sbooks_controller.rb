class SbooksController < ApplicationController
  # GET /sbooks
  # GET /sbooks.json
  def index
    @sbooks = Sbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sbooks }
    end
  end

  # GET /sbooks/1
  # GET /sbooks/1.json
  def show
    @sbook = Sbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sbook }
    end
  end

  # GET /sbooks/new
  # GET /sbooks/new.json
  def new
    @sbook = Sbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sbook }
    end
  end

  # GET /sbooks/1/edit
  def edit
    @sbook = Sbook.find(params[:id])
  end

  # POST /sbooks
  # POST /sbooks.json
  def create
    @sbook = Sbook.new(params[:sbook])

    respond_to do |format|
      if @sbook.save
        format.html { redirect_to @sbook, notice: 'Sbook was successfully created.' }
        format.json { render json: @sbook, status: :created, location: @sbook }
      else
        format.html { render action: "new" }
        format.json { render json: @sbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sbooks/1
  # PUT /sbooks/1.json
  def update
    @sbook = Sbook.find(params[:id])

    respond_to do |format|
      if @sbook.update_attributes(params[:sbook])
        format.html { redirect_to @sbook, notice: 'Sbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sbooks/1
  # DELETE /sbooks/1.json
  def destroy
    @sbook = Sbook.find(params[:id])
    @sbook.destroy

    respond_to do |format|
      format.html { redirect_to sbooks_url }
      format.json { head :no_content }
    end
  end
end
