class MaintopicsController < ApplicationController
  # GET /maintopics
  # GET /maintopics.json
  before_filter :load_topic, :only => [:edit, :update, :show, :destroy]

  def index
    @tcontainer = Tcontainer.find(params[:tcontainer_id])
    @maintopics = @tcontainer.maintopics.all
#    @maintopics = Maintopic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintopics }
    end
  end

  # GET /maintopics/1
  # GET /maintopics/1.json
  def show
  end

  # GET /maintopics/new
  # GET /maintopics/new.json
  def new
    if current_user
       @user = current_user
       @tcontainer = Tcontainer.find(params[:tcontainer_id])
       #@topic = @seperator.topics.build
       @maintopic = @tcontainer.maintopics.build
       #    @maintopic.user_id = @user
       #    @maintopic = Maintopic.new

       respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @maintopic }
       end
    else
       redirect_to root_url
    end
  end

  # GET /maintopics/1/edit
  def edit
  end

  # POST /maintopics
  # POST /maintopics.json
  def create
     if current_user
        @user = current_user.id
        @tcontainer = Tcontainer.find(params[:tcontainer_id])
        @maintopic = @tcontainer.maintopics.new(params[:maintopic])
        @maintopic.user_id = @user
           if @maintopic.save
              redirect_to tcontainer_maintopic_path(@tcontainer, @maintopic), notice: 'Maintopic was successfully created.'
           else
              render "new"
           end
     else
        redirect_to root_url
     end
  end

  # PUT /maintopics/1
  # PUT /maintopics/1.json
  def update

    respond_to do |format|
      if @maintopic.update_attributes(params[:maintopic])
        format.html { redirect_to tcontainer_maintopic_path(@tcontainer, @maintopic), notice: 'Maintopic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maintopic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintopics/1
  # DELETE /maintopics/1.json
  def destroy
    @maintopic.destroy

    respond_to do |format|
      format.html { redirect_to forum_tcontainer_path(@tcontainer.forum_id, @tcontainer.id) }
      format.json { head :no_content }
    end
  end

  private
     def load_topic
        @maintopic = Maintopic.find(params[:id])
        @tcontainer = Tcontainer.find(@maintopic.tcontainer_id)
        @content = Tcontainer.find(params[:tcontainer_id])
        if @content.id != @tcontainer.id
#           raise "I been tampered with and should redirect to the root page"
           redirect_to root_url
        end
     end

end
