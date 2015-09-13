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
      self.current_user = nil
      cookies.delete(:remember_token)
      cookies.delete(:expireTime)
   end
end
