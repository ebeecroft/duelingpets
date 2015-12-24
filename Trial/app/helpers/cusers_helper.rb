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
      tokenTime = expireTime + 1.month
      cookies[:remember_token] = { :value => user.remember_token, :expires => tokenTime }
      cookies[:expireTime] = {:value => expireTime, :expires => expireTime } #Will be removed in the new version
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

   #View only
   def timeleft
      if(current_user)
         if(expires)
            render "layouts/timeleft"
         end
      end
   end

   #Controller only
   def auto_logout
      if(current_user)
         if(expires.nil?)
            return true
         else
            expired = currentTime >= expires
            if(expired)
               return true
            else
               return false
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
