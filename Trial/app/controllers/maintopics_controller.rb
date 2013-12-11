class MaintopicsController < ApplicationController
  # GET /maintopics
  # GET /maintopics.json
  def index
    @maintopics = Maintopic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maintopics }
    end
  end

  # GET /maintopics/1
  # GET /maintopics/1.json
  def show
    @maintopic = Maintopic.find(params[:id])

#    @subtopic = @maintopic.subtopics.all
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @maintopic }
#    end
  end

  # GET /maintopics/new
  # GET /maintopics/new.json
  def new
    if current_user
       @user = current_user
       @maintopic = @user.maintopics.build
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
    @maintopic = Maintopic.find(params[:id])
  end

  # POST /maintopics
  # POST /maintopics.json
  def create
     if current_user
        @user = current_user.id
        @maintopic = Maintopic.new(params[:maintopic])
        @maintopic.user_id = @user
        respond_to do |format|
           if @maintopic.save
              format.html { redirect_to @maintopic, notice: 'Maintopic was successfully created.' }
              format.json { render json: @maintopic, status: :created, location: @maintopic }
           else
              format.html { render action: "new" }
              format.json { render json: @maintopic.errors, status: :unprocessable_entity }
           end
        end
     else
        redirect_to root_url
     end
  end

  # PUT /maintopics/1
  # PUT /maintopics/1.json
  def update
    @maintopic = Maintopic.find(params[:id])

    respond_to do |format|
      if @maintopic.update_attributes(params[:maintopic])
        format.html { redirect_to @maintopic, notice: 'Maintopic was successfully updated.' }
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
    @maintopic = Maintopic.find(params[:id])
    @maintopic.destroy

    respond_to do |format|
      format.html { redirect_to maintopics_url }
      format.json { head :no_content }
    end
  end
end
