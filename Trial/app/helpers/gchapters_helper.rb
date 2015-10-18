module GchaptersHelper

   def mode(type)
      #Check if Maintenance is turned_on
      allmode = Maintenancemode.find_by_id(1)
      bookmode = Maintenancemode.find_by_id(4)
      mode_turned_on = (allmode.maintenance_on || bookmode.maintenance_on)
      #Determine if any maintenance is on
      if(mode_turned_on)
         #Determine if we are a regular user
         regularUser = (!current_user || !current_user.admin?)
         if(regularUser)
            #Determine which maintenance mode is on
            if(allmode.maintenance_on)
               redirect_to maintenance_path
            else
#               redirect_to petowners_maintenance_path
            end
         else
            switch type
         end
      else
         switch type
      end
   end

   private
      def switch(type)
         if(type == "index") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  allGchapters = Gchapter.order("id").page(params[:page]).per(10)
                  @gchapters = allGchapters
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "new") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  newGchapter = Gchapter.new
                  @gchapter = newGchapter
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "create") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  newGchapter = Gchapter.new(params[:gchapter])
                  currentTime = Time.now
                  newGchapter.created_on = currentTime
                  @gchapter = newGchapter
                  if(@gchapter.save)
                     flash[:success] = 'Gchapter was successfully created.'
                     redirect_to gchapters_url
                  else
                     render "new"
                  end
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "edit") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  gchapterFound = Gchapter.find_by_id(params[:id])
                  if(gchapterFound)
                     @gchapter = gchapterFound
                  else
                     render "public/404"
                  end
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "update") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  gchapterFound = Gchapter.find_by_id(params[:id])
                  if(gchapterFound)
                     @gchapter = gchapterFound
                     if(@gchapter.update_attributes(params[:gchapter]))
                        flash[:success] = 'Gchapter was successfully updated.'
                        redirect_to gchapters_url
                     else
                        render "edit"
                     end
                  else
                     render "public/404"
                  end
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "destroy") #Admin

         end
      end
end
