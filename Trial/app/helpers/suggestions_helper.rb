module SuggestionsHelper

   def mode(type)
      code = auto_logout
      if(code == true)
         sign_out
         redirect_to root_path
      else
         #Check if Maintenance is turned_on
         allmode = Maintenancemode.find_by_id(1)
         mode_turned_on = allmode.maintenance_on
         #Determine if any maintenance is on
         if(mode_turned_on)
            #Determine if we are a regular user
            regularUser = (!current_user || !current_user.admin?)
            if(regularUser)
               redirect_to maintenance_path
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
         if(type == "index")
            admin = (current_user && current_user.admin)
            if(admin)
               allSuggestions = Suggestion.order("id").page(params[:page]).per(10)
               @suggestions = allSuggestions
            else
               redirect_to root_path
            end
         elsif(type == "new")
            logged_in = current_user
            if(logged_in)
               newSuggestion = Suggestion.new
               @suggestion = newSuggestion
            else
               redirect_to root_path
            end
         elsif(type == "create")
            logged_in = current_user
            if(logged_in)
               newSuggestion = Suggestion.new(params[:suggestion])
               @suggestion = newSuggestion
               if(@suggestion.save)
                  redirect_to root_path, notice: 'Suggestion was successfully created.'
               else
                  render "new"
               end
            else
               redirect_to root_path
            end
         elsif(type == "destroy")
            admin = (current_user && current_user.admin)
            if(admin)
               suggestionFound = Suggestion.find_by_id(params[:id])
               if(suggestionFound)
                  @suggestion = suggestionFound
                  @suggestion.destroy
                  redirect_to suggestions_url
               else
                  render "public/404"
               end
            else
               redirect_to root_path
            end
         end
      end
end
