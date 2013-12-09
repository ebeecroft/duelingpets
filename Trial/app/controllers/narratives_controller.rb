class NarrativesController < ApplicationController
  # GET /narratives
  # GET /narratives.json
  before_filter :load_subtopic, :only =>[:create, :index, :new]
  before_filter :valid_subtopic_connections, :except =>[:create, :index, :new]
  def index
#    @narratives = Narrative.all
    @narratives = @subtopic.narratives.all
    @maintopic = Maintopic.find(@subtopic.maintopic_id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @narratives }
    end
  end

  # GET /narratives/1
  # GET /narratives/1.json
  def show
#    @topic = Topic.find(@post.topic_id) 
#    @subtopic
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @narrative }
    end
  end

  # GET /narratives/new
  # GET /narratives/new.json
  def new
#    @narrative = Narrative.new
     @user = current_user.id
     @narrative = @subtopic.narratives.build
     @narrative.user_id = @user

#    @narrative = @subtopic.narratives.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @narrative }
    end
  end

  # GET /narratives/1/edit
  def edit
  end

  # POST /narratives
  # POST /narratives.json
  def create
#     @narrative = Narrative.new(params[:narrative])
     @user = current_user.id
     @narrative = @subtopic.narratives.new(params[:narrative])
     @narrative.user_id = @user
     if !(@narrative.subtopic_id == @subtopic.id) #Prevents a narrative from being assigned data to a subtopic that doesn't match
        redirect_to maintopic_subtopic_url
        return
     end
     @maintopic = Maintopic.find(@subtopic.maintopic_id)

    respond_to do |format|
      if @narrative.save
        format.html { redirect_to maintopic_subtopic_path(@maintopic, @subtopic), notice: 'Narrative was successfully created.' }
        format.json { render json: @narrative, status: :created, location: @narrative }
      else
        format.html { render action: "new" }
        format.json { render json: @narrative.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /narratives/1
  # PUT /narratives/1.json
  def update
     @maintopic = Maintopic.find(@subtopic.maintopic_id)
    respond_to do |format|
      if @narrative.update_attributes(params[:narrative])
        format.html { redirect_to maintopic_subtopic_path(@maintopic, @subtopic), notice: 'Narrative was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @narrative.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /narratives/1
  # DELETE /narratives/1.json
  def destroy
    @maintopic = Maintopic.find(@subtopic.maintopic_id)
    @narrative = Narrative.find(params[:id])
    @narrative.destroy

    respond_to do |format|
      format.html { redirect_to maintopic_subtopic_path(@maintopic,@subtopic) }
      format.json { head :no_content }
    end
  end

  private

     def valid_subtopic_connections
         @subtopic = Subtopic.find(params[:subtopic_id])
         @narrative = Narrative.find(params[:id])
         if !(@narrative.subtopic_id == @subtopic.id) #Prevents a subtopic from being assigned data to a maintopic that doesn't match
            redirect_to maintopic_subtopic_url
            return
         end
      end
      def load_subtopic
         @subtopic = Subtopic.find(params[:subtopic_id])
      end
end
