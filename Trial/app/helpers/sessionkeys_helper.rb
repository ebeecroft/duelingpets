module SessionkeysHelper

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
         if(type == "index") #Admin only
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  @sessionkeys = Sessionkey.order("id").page(params[:page]).per(10)
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "new") #Admin only
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  newKey = Sessionkey.new
                  @sessionkey = newKey
                  #@user = logged_in
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "create") #Admin only
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  newKey = Sessionkey.new(params[:sessionkey])
                  newKey.remember_token = "NULL"
                  #newKey.user_id = logged_in.id
                  @sessionkey = newKey
                  @sessionkey.save
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         end
      end
end
