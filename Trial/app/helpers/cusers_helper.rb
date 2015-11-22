module CusersHelper
#A current user helper

   #Mandatory
   def expires
      cookies[:expireTime]
   end

   #Mandatory
   def currentTime
      Time.now
   end

   #Mandatory
   def sign_in(user)
      expireTime = 2.days.from_now.utc
      cookies[:remember_token] = { :value => user.remember_token, :expires => expireTime }
      cookies[:expireTime] = {:value => expireTime, :expires => expireTime }
      self.current_user = user
   end

   #Mandatory
   def current_user=(user) #sets the current_user to the user's value
      @current_user = user
   end

   #Mandatory
   def current_user #Sets the current_user if it is nil
      @current_user ||= User.find_by_remember_token(cookies[:remember_token])
   end

   #Mandatory
   def sign_out
      flash[:success] = "#{current_user.vname} was logged out"
      cookies.delete(:remember_token)
      cookies.delete(:expireTime)
      self.current_user = nil
   end

   #Move these to a different helper
   def automatic_logout
      if(expires.nil?)
         #Only for users who were originally created before expires existed
         if(current_user)
            sign_out #Need to figure out something
         end
      else
         if(current_user)
            expired = currentTime > expires
            if(expired)
               sign_out
               redirect_to root_path
            else
               #This works correctly
               render "layouts/timeleft"
            end
         end
      end
   end

   #Move these to a different helper
   def profile
      if(current_user)
         render 'layouts/loggedin'
      else
         render "layouts/guest"
      end
   end
end
