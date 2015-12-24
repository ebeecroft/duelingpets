module UsersHelper

   def mode(type)
      code = auto_logout
      if(code == true)
         sign_out
         redirect_to root_path
      else
         #Check if Maintenance is turned_on
         allmode = Maintenancemode.find_by_id(1)
         usermode = Maintenancemode.find_by_id(2)
         mode_turned_on = (allmode.maintenance_on || usermode.maintenance_on)
         #Determine if any maintenance is on
         if(mode_turned_on)
            #Determine if we are a regular user
            regularUser = (!current_user || !current_user.admin?)
            if(regularUser)
               #Determine which maintenance mode is on
               if(allmode.maintenance_on)
                  redirect_to maintenance_path
               else
                  redirect_to users_maintenance_path
               end
            else
               switch type
            end
         else
            switch type
         end
      end
   end

   private
      def switch(type)
         if(type == "index") #Admin only
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  @users = User.order("id").page(params[:page]).per(10)
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "show") #Guest access
            userFound = User.find_by_vname(params[:id])
            if(userFound)
               @pouch = Pouch.find_by_id(userFound.id)
               commentCount = 0 #May remove this variable in a later build
               allComments = Comment.all
               userComments = allComments.select{|comment| comment.user_id == userFound.id}
               @comment = Kaminari.paginate_array(userComments).page(params[:page]).per(10)
               commentCount = userComments.count
               forumCount = 0
               userFound.forums.each do |forum|
                  forumCount += 1
               end
               seriesCount = 0
               userFound.sbooks.each do |sbook|
                  seriesCount += 1
               end
               @fcount = forumCount
               @scount = seriesCount
               @count = commentCount
               @user = userFound
            else
               render "public/404"
            end
         elsif(type == "new") #Guest access
            @user = User.new
         elsif(type == "create") #Guest access
            newMember = User.new(params[:user])
            currentTime = Time.now
            newMember.joined_on = currentTime
            @user = newMember
            if(@user.save)
               newPouch = Pouch.new(params[:pouch])
               newPouch.user_id = newMember.id
               @pouch = newPouch
               @pouch.save
               sign_in newMember
               flash[:success] = "Welcome to the Duelingpets Website!"
               redirect_to @user
            else
               render "new"
            end
         elsif(type == "edit") #Login only and same user
            logged_in = current_user
            if(logged_in)
               userFound = User.find_by_vname(params[:id])
               if(userFound)
                  userMatch = ((logged_in.id == userFound.id) || logged_in.admin)
                  if(userMatch)
                     @user = userFound
                  else
                     redirect_to root_path
                  end
               else
                  render "public/404"
               end
            else
               redirect_to root_path
            end
         elsif(type == "update") #Login only and same user
            logged_in = current_user
            if(logged_in)
               userFound = User.find_by_vname(params[:id])
               if(userFound)
                  userMatch = ((logged_in.id == userFound.id) || logged_in.admin)
                  if(userMatch)
                     @user = userFound
                     if(@user.update_attributes(params[:user]))
                        if(!logged_in.admin || logged_in == userFound)
                           sign_in @user
                        end
                        flash[:success] = 'User was successfully updated.'
                        redirect_to @user
                        #redirect_to @user, notice: 'User was successfully updated.'
                     else
                        render "edit"
                     end
                  else
                     redirect_to root_path
                  end
               else
                  render "public/404"
               end
            else
               redirect_to root_path
            end
         elsif(type == "destroy") #Admin only
            logged_in = current_user
            if(logged_in)
               userFound = User.find_by_vname(params[:id])
               if(userFound)
                  if(logged_in.admin)
                     if(!userFound.admin)
                        @user = userFound
                        @user.destroy
                        flash[:success] = 'User was successfully removed.'
                        redirect_to users_url
                        #redirect_to users_url, notice: 'User was successfully removed.'
                     else
                        redirect_to root_path
                     end
                  else
                     redirect_to root_path
                  end
               else
                  render "public/404"
               end
            else
               redirect_to root_path
            end
         end
      end
end
