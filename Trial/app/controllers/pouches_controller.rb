class PouchesController < ApplicationController

  def index
     if(current_user && current_user.admin)
        @pouches = Pouch.order("id").page(params[:page]).per(10)
     else
        redirect_to root_path
     end
  end
end
