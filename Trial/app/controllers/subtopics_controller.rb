class SubtopicsController < ApplicationController
  # GET /subtopics
  # GET /subtopics.json
  #before_filter :load_forum

  before_filter :load_topic, :only => [:edit, :update, :show, :destroy]
  before_filter :load_maintopic, :only =>[:create, :index, :new]

  def index
     if current_user && current_user.admin?
        @subtopics = @maintopic.subtopics.all
     else
        render "public/404"
     end
  end

  # GET /subtopics/1
  # GET /subtopics/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subtopic }
    end
  end

  # GET /subtopics/new
  # GET /subtopics/new.json
  def new
     if current_user
        @user = current_user.id
        @subtopic = @maintopic.subtopics.build
        @subtopic.user_id = @user
     else
        redirect_to root_url
     end
  end

  # GET /subtopics/1/edit
  def edit
  end

  # POST /subtopics
  # POST /subtopics.json
  def create
     if current_user
        @user = current_user.id
        @subtopic = @maintopic.subtopics.new(params[:subtopic])
        @subtopic.user_id = @user
        if !(@subtopic.maintopic_id == @maintopic.id) #Prevents a subtopic from being assigned data to a maintopic that doesn't match
           redirect_to @maintopic
           return
        end

        @subtopic.created_on = Time.now
        @subtopic.save
        #if @subtopic.save
        #   redirect_to @maintopic.subtopic
        #else
        #   render "new";
        #end
        redirect_to maintopic_subtopic_path(@maintopic, @subtopic)
     else
        redirect_to root_url
     end
  end

  # PUT /subtopics/1
  # PUT /subtopics/1.json
  def update
    respond_to do |format|
      if @subtopic.update_attributes(params[:subtopic])
        format.html { redirect_to maintopic_subtopic_path([@maintopic, @subtopic]), notice: 'Subtopic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subtopic.errors, status: :unprocessable_entity }
      end
    end
  end
#raise
  # DELETE /subtopics/1
  # DELETE /subtopics/1.json
  def destroy
    @subtopic.destroy
    
    respond_to do |format|
      format.html { redirect_to tcontainer_maintopic_path(@maintopic.tcontainer_id, @maintopic.id) }
      format.json { head :no_content }
    end
  end
   private
      def load_topic
        @subtopic = Subtopic.find(params[:id])
        @maintopic = Maintopic.find(@subtopic.maintopic_id)
        @content = Maintopic.find(params[:maintopic_id])
        if @content.id != @maintopic.id
#           raise "I been tampered with and should redirect to the root page"
           redirect_to root_url
        end
      end

      def load_maintopic
         @maintopic = Maintopic.find(params[:maintopic_id])
      end
end
