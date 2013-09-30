class SubtopicsController < ApplicationController
  # GET /subtopics
  # GET /subtopics.json
  #before_filter :load_forum
  def index
    @maintopic = Maintopic.find(params[:maintopic_id])
    @subtopics = Subtopic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @subtopics }
    end
  end

  # GET /subtopics/1
  # GET /subtopics/1.json
  def show
    @maintopic = Maintopic.find(params[:maintopic_id])
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
     @maintopic = Maintopic.find(params[:maintopic_id])
     @subtopic = @maintopic.subtopics.build
  end

  # GET /subtopics/1/edit
  def edit
    @maintopic = Maintopic.find(params[:maintopic_id])
    @subtopic = Subtopic.find(params[:id])
    #@subtopic = @maintopic.subtopics.build
  end

  # POST /subtopics
  # POST /subtopics.json
  def create
#    @maintopic = Maintopic.find_by_id(params[:main_id])
     @maintopic = Maintopic.find(params[:maintopic_id])
     @subtopic = @maintopic.subtopics.new(params[:subtopic])
     @subtopic.save
     #if @subtopic.save
     #   redirect_to @maintopic.subtopic
     #else
     #   render "new";
     #end
     redirect_to @maintopic
  end

  # PUT /subtopics/1
  # PUT /subtopics/1.json
  def update
    @maintopic = Maintopic.find(params[:maintopic_id])
    #@subtopic = @maintopic.subtopics.new(params[:subtopic])
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
   private
      def load_forum
         if (params[:id])
            @subtopic = Subtopic.find(params[:id])
            @maintopic = @subtopic.maintopic #rescue redirect_to(maintopics_path)
         elsif (params[:forum_id])
            @maintopic = Maintopic.find(params[:maintopic_id])
         else
            #redirect_to(maintopics_path)
            #echo "I am here."
         end
      end
end
