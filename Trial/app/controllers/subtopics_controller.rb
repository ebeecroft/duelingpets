class SubtopicsController < ApplicationController
  # GET /subtopics
  # GET /subtopics.json
  def index
    @maintopic.subtopics = Subtopic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subtopics }
    end
  end

  # GET /subtopics/1
  # GET /subtopics/1.json
  def show
    @subtopic = Subtopic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subtopic }
    end
  end

  # GET /subtopics/new
  # GET /subtopics/new.json
  def new
#    @maintopic = Maintopic.find_by_id(params[:main_id])
#    @subtopic = @maintopic.subtopics.build

#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @subtopic }
#    end
  end

  # GET /subtopics/1/edit
  def edit
    @subtopic = Subtopic.find(params[:id])
  end

  # POST /subtopics
  # POST /subtopics.json
  def create
    @maintopic = Maintopic.find_by_id(params[:main_id])
    @subtopic = @maintopic.subtopics.create(params[:subtopic])
    @subtopic.save
    redirect_to @maintopic.subtopic
  end

  # PUT /subtopics/1
  # PUT /subtopics/1.json
  def update
    @subtopic = Subtopic.find(params[:id])

    respond_to do |format|
      if @subtopic.update_attributes(params[:subtopic])
        format.html { redirect_to @subtopic, notice: 'Subtopic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subtopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subtopics/1
  # DELETE /subtopics/1.json
#  def destroy
#    @subtopic = Subtopic.find(params[:id])
#    @subtopic.destroy

#    respond_to do |format|
#      format.html { redirect_to subtopics_url }
#      format.json { head :no_content }
#    end
#  end
end
