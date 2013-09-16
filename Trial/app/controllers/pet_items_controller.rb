class PetItemsController < ApplicationController
  # GET /pet_items
  # GET /pet_items.json
  def index
    @pet_items = PetItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pet_items }
    end
  end

  # GET /pet_items/1
  # GET /pet_items/1.json
  def show
    @pet_item = PetItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pet_item }
    end
  end

  # GET /pet_items/new
  # GET /pet_items/new.json
  def new
    @pet_item = PetItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pet_item }
    end
  end

  # GET /pet_items/1/edit
  def edit
    @pet_item = PetItem.find(params[:id])
  end

  # POST /pet_items
  # POST /pet_items.json
  def create
    @pet_item = PetItem.new(params[:pet_item])

    respond_to do |format|
      if @pet_item.save
        format.html { redirect_to @pet_item, notice: 'Pet item was successfully created.' }
        format.json { render json: @pet_item, status: :created, location: @pet_item }
      else
        format.html { render action: "new" }
        format.json { render json: @pet_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pet_items/1
  # PUT /pet_items/1.json
  def update
    @pet_item = PetItem.find(params[:id])

    respond_to do |format|
      if @pet_item.update_attributes(params[:pet_item])
        format.html { redirect_to @pet_item, notice: 'Pet item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pet_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_items/1
  # DELETE /pet_items/1.json
  def destroy
    @pet_item = PetItem.find(params[:id])
    @pet_item.destroy

    respond_to do |format|
      format.html { redirect_to pet_items_url }
      format.json { head :no_content }
    end
  end
end
