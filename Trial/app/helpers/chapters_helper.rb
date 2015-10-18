module ChaptersHelper

   def mode(type)
      #Check if Maintenance is turned_on
      allmode = Maintenancemode.find_by_id(1)
      chaptermode = Maintenancemode.find_by_id(16)
      mode_turned_on = (allmode.maintenance_on || chaptermode.maintenance_on)
      #Determine if any maintenance is on
      if(mode_turned_on)
         #Determine if we are a regular user
         regularUser = (!current_user || !current_user.admin?)
         if(regularUser)
            #Determine which maintenance mode is on
            if(allmode.maintenance_on)
               redirect_to maintenance_path
            else
               redirect_to chapters_maintenance_path
            end
         else
            switch type
         end
      else
         switch type
      end
   end

   private
      def storeChapter(bookFound, logged_in)
         gchapterFound = Gchapter.find_by_id(params[:gchapter_id])
         if(gchapterFound)
            #Create the new Chapter
            newChapter = bookFound.chapters.new(params[:chapter])
            currentTime = Time.now
            newChapter.created_on = currentTime
            newChapter.book_id = bookFound.id
            newChapter.user_id = logged_in.id
            newChapter.gchapter_id = gchapterFound.id
            #Discover how many Chapters already exist
            min = bookFound.chapters.count
            max = min + 2
            #Checks to see if the Chapter being created is in the valid range
            if(gchapterFound.id > min && gchapterFound.id < max)
               @chapter = newChapter
               if(@chapter.save)
                  @book = bookFound
                  flash[:success] = 'Chapter was successfully created.'
                  redirect_to sbook_book_path(@book.sbook, @chapter.book)
               else
                  render "new"
               end
            else
               @book = bookFound
               flash[:error] = 'A general chapter with that number is already in use'
               redirect_to new_book_chapter_path(@book.id)
            end
         else
            redirect_to root_path
         end
      end

      def storeBooksForNew(bookFound, logged_in)
         newChapter = bookFound.chapters.new #Chapter.new
         newChapter.user_id = logged_in.id
         @chapter = newChapter
         @book = bookFound
      end

      def switch(type)
         if(type == "index") #Admin(All chapters reviewed and not)
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  allChapters = Chapter.order("id").page(params[:page]).per(10)
                  @chapters = allChapters
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "new") #Login only
            logged_in = current_user
            if(logged_in)
               bookFound = Book.find_by_id(params[:book_id])
               min = bookFound.chapters.count
               max = min + 2
               nextChapter = Gchapter.select{|chapter| (chapter.id > min && chapter.id < max)}
               #In the future release there will be an new Gchapter create button for users to use
               @gchapters = nextChapter
               if(bookFound)
                  if(bookFound.sbook.series_open)
                     storeBooksForNew(bookFound, logged_in)
                  else
                     userMatch = (logged_in.id == bookFound.sbook.user.id)
                     if(userMatch)
                        storeBooksForNew(bookFound, logged_in)
                     else
                        redirect_to root_path
                     end
                  end
               else
                  render "public/404"
               end
            else
               redirect_to root_path
            end
         elsif(type == "create") #Login only
            logged_in = current_user
            if(logged_in)
               bookFound = Book.find_by_id(params[:book_id])
               if(bookFound)
                  seriesOpen = bookFound.sbook.series_open
                  if(seriesOpen)
                     storeChapter(bookFound, logged_in)
                  else
                     userMatch = (logged_in.id == bookFound.user_id)
                     if(userMatch)
                        storeChapter(bookFound, logged_in)
                     else
                        redirect_to root_path
                     end
                  end
               else
                  render "public/404"
               end
            else
               redirect_to root_path
            end
         elsif(type == "edit") #Login only and same user
            logged_in = current_user
            if(logged_in)
               @gchapters = Gchapter.all
               chapterFound = Chapter.find_by_id(params[:id])
               if(chapterFound)
                  bookFound = Book.find_by_id(params[:book_id])
                  if(bookFound)
                     bookMatch = (chapterFound.book_id == bookFound.id)
                     if(bookMatch)
                        userMatch = ((logged_in.id == chapterFound.user_id) || logged_in.admin)
                        if(userMatch)
                           @book = bookFound
                           @chapter = chapterFound
                        else
                           redirect_to root_path
                        end
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
         elsif(type == "update") #Login only and same user
            logged_in = current_user
            if(logged_in)
               chapterFound = Chapter.find_by_id(params[:id])
               if(chapterFound)
                  bookFound = Book.find_by_id(params[:book_id])
                  if(bookFound)
                     bookMatch = (chapterFound.book_id == bookFound.id)
                     if(bookMatch)
                        userMatch = ((logged_in.id == bookFound.user_id) || logged_in.admin)
                        if(userMatch)
                           @chapter = chapterFound
                           if(@chapter.update_attributes(params[:chapter]))
                              @book = bookFound
                              flash[:success] = 'Chapter was successfully updated.'
                              redirect_to sbook_book_path(@book.sbook, @chapter.book)
                           else
                              render "edit"
                           end
                        else
                           redirect_to root_path
                        end
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
         elsif(type == "destroy") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  chapterFound = Chapter.find_by_id(params[:id])
                  if(chapterFound)
                     @chapter = chapterFound
                     @chapter.destroy
                     redirect_to chapters_url
                  else
                     render "public/404"
                  end
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "review") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  allChapters = Chapter.all
                  chaptersToReview = allChapters.select{|chapter| !chapter.reviewed}
                  @chapters = Kaminari.paginate_array(chaptersToReview).page(params[:page]).per(10)
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "approve") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  chapterFound = Chapter.find_by_id(params[:chapter_id])
                  if(chapterFound)
                     chapterFound.reviewed = true
                     @chapter = chapterFound
                     @chapter.save
                     redirect_to chapters_review_path
                  else
                     render "public/404"
                  end
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         elsif(type == "deny") #Admin
            logged_in = current_user
            if(logged_in)
               if(logged_in.admin)
                  chapterFound = Chapter.find_by_id(params[:chapter_id])
                  if(chapterFound)
                     #Retrieve the user who owns this chapter first
                     #userEmail = chapterFound.user.email
                     #Send mail to user with link to edit the chapter they sent
                     @chapter = chapterFound
                     redirect_to chapters_review_path
                  else
                     render "public/404"
                  end
               else
                  redirect_to root_path
               end
            else
               redirect_to root_path
            end
         end
      end
end
