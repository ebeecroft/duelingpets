module SessionsHelper
   def mode(type)
      code = auto_logout
      if(code == true)
         sign_out
         redirect_to root_path
      else
         switch type
      end
   end

   private
      def switch(type)
         if(type == "create")
            #Determines if the session is actually valid
            userFound = User.find_by_vname(params[:session][:vname].downcase)
            if(userFound)
               passwordValid = userFound.authenticate(params[:session][:password])
               if(passwordValid)
                  #Determine if Maintenance is turned on
                  allmode = Maintenancemode.find_by_id(1)
                  mode_turned_on = allmode.maintenance_on
                  if(mode_turned_on)
                     if(userFound.admin)
                        sign_in userFound
                        redirect_to userFound
                     else
                        flash.now[:error] = 'Only the admin is allowed to login at this time'
                        render 'new'
                     end
                  else
                     sign_in userFound
                     redirect_to userFound
                  end
               else
                  flash.now[:error] = 'Invalid vname/password combination'
                  render 'new'
               end
            else
               flash.now[:error] = 'Invalid vname/password combination'
               render 'new'
            end
         elsif(type == "destroy")
            #Determines if user session still exists
            logged_in = current_user
            if(logged_in)
               sign_out
               redirect_to root_path
            end
         end
      end
end
