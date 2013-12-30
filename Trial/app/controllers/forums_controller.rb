class ForumsController < ApplicationController
  # GET /forums
  # GET /forums.json
  def index
    @user = User.find_by_vname(params[:user_id])
    if @user.nil?
       if params[:user_id]
          #raise "I am not empty"
          render "public/404"
          return
       end
       @forums = Forum.all
    else
       @forums = @user.forums.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forums }
    end
  end

  # GET /forums/1
  # GET /forums/1.json
  def show
    @forum = Forum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /forums/new
  # GET /forums/new.json
  def new
    @user = current_user
#    @user = User.find_by_vname(params[:user_id])
#    @user = User.find_by_vname(params[:user_id])
    @forum = @user.forums.build
#    @forum = Forum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @forum }
    end
  end

  # GET /forums/1/edit
  def edit
    @forum = Forum.find(params[:id])
  end

  # POST /forums
  # POST /forums.json
  def create
    @user = current_user
    @forum = @user.forums.new(params[:forum])

    respond_to do |format|
      if @forum.save
        format.html { redirect_to user_forum_path(@user, @forum), notice: 'Forum was successfully created.' }
        format.json { render json: @forum, status: :created, location: @forum }
      else
        format.html { render action: "new" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forums/1
  # PUT /forums/1.json
  def update
    @forum = Forum.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to forums_url }
      format.json { head :no_content }
    end
  end
end
