module CommentsHelper

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
                  allComments = Comment.order("id").page(params[:page]).per(10)
                  @comments = allComments
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "create") #logged in only
            logged_in = current_user
            if(logged_in)
               userFound = User.find_by_vname(params[:user_id])
               if(userFound)
                  newComment = userFound.comments.new(params[:comment])
                  newComment.from_user_id = logged_in.id
                  currentTime = Time.now
                  newComment.created_on = currentTime
                  @comment = newComment
                  @comment.save
                  @user = userFound
                  redirect_to @user
               else
                  render "public/404"
               end
            else
               redirect_to root_path
            end
         elsif(type == "destroy") #logged in only
            logged_in = current_user
            if(logged_in)
               commentFound = Comment.find(params[:id])
               if(commentFound)
                  userFound = User.find_by_vname(params[:user_id])
                  userMatch = ((logged_in.id == commentFound.from_user_id) || logged_in.admin)
                  if(userMatch)
                     @user = userFound
                     @comment = commentFound
                     @comment.destroy
                     redirect_to userFound, notice: 'Comment was successfully removed.'
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
