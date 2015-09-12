module MaintenancemodesHelper

   def mode(type)
      logged_in = current_user
      if(logged_in)
         if(logged_in.admin)
            switch(type)
         else
            redirect_to root_path
         end
      else
         redirect_to root_path
      end
   end

   private
      def switch(type)
         if(type == "index") #Admin only
            @maintenancemodes = Maintenancemode.all
         elsif(type == "show") #Admin only
            #Not needed since we will only be using index
         elsif(type == "new") #Admin only
            @maintenancemode = Maintenancemode.new
         elsif(type == "create") #Admin only
            newMaintenancemode = Maintenancemode.new(params[:maintenancemode])
            currentTime = Time.now
            newMaintenancemode.created_on = currentTime
            @maintenancemode = newMaintenancemode
            if(@maintenancemode.save)
               redirect_to maintenancemodes_url, notice: 'Maintenancemode was successfully created.'
            else
               render "new"
            end
         elsif(type == "edit") #Admin only
            maintenancemodeFound = Maintenancemode.find_by_id(params[:id])
            if(maintenancemodeFound)
               @maintenancemode = maintenancemodeFound
            else
               render "public/404"
            end
         elsif(type == "update") #Admin only
            maintenancemodeFound = Maintenancemode.find_by_id(params[:id])
            if(maintenancemodeFound)
               @maintenancemode = maintenancemodeFound
               if(@maintenancemode.update_attributes(params[:maintenancemode]))
                  redirect_to maintenancemodes_url, notice: 'Maintenancemode was successfully updated.'
               else
                  render "edit"
               end
            else
               render "public/404"
            end
         elsif(type == "destroy") #Admin only
            #Destroy should not be used
         end
      end
end
