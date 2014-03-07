class TcontainersController < ApplicationController
  # GET /tcontainers
  # GET /tcontainers.json
  before_filter :load_topic, :only => [:edit, :update, :show, :destroy]

  def index
     if current_user && current_user.admin?
        @forum = Forum.find_by_name(params[:forum_id])
        @tcontainers = @forum.tcontainers.all
     else
        render "public/404"
     end
  end

  # GET /tcontainers/1
  # GET /tcontainers/1.json
  def show
  end

  # GET /tcontainers/new
  # GET /tcontainers/new.json
  def new
    @forum = Forum.find_by_name(params[:forum_id])
    @tcontainer = @forum.tcontainers.build
#    @tcontainer = Tcontainer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tcontainer }
    end
  end

  # GET /tcontainers/1/edit
  def edit
  end

  # POST /tcontainers
  # POST /tcontainers.json
  def create
    @forum = Forum.find_by_name(params[:forum_id])
    @tcontainer = @forum.tcontainers.new(params[:tcontainer])
    @tcontainer.created_on = Time.now
    if @tcontainer.save
        redirect_to forum_tcontainer_path(@forum, @tcontainer), notice: 'Tcontainer was successfully created.' 
    else
        render action: "new"
    end
  end

  # PUT /tcontainers/1
  # PUT /tcontainers/1.json
  def update

    respond_to do |format|
      if @tcontainer.update_attributes(params[:tcontainer])
        format.html { redirect_to forum_tcontainer_path(@tcontainer.forum, @tcontainer.id), notice: 'Tcontainer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tcontainer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tcontainers/1
  # DELETE /tcontainers/1.json
  def destroy
    @tcontainer.destroy

    respond_to do |format|
      format.html { redirect_to user_forum_path(@forum.user_id, @forum.id) }
      format.json { head :no_content }
    end
  end

  private
     def load_topic
        @tcontainer = Tcontainer.find(params[:id])
        @forum = Forum.find(@tcontainer.forum_id)
        @content = Forum.find_by_name(params[:forum_id])
        if @content.id != @forum.id
#           raise "I been tampered with and should redirect to the root page"
           redirect_to root_url
        end
     end
end
