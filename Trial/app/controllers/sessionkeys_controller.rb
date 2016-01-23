class SessionkeysController < ApplicationController
  include SessionkeysHelper

  def index
     mode "index"
  end

  def show #Not used
  end

  def new
     mode "new"
  end

  def edit #Not used
  end

  def create
     mode "create"
  end

  def update #Not used
  end

  def destroy #Not used
  end
end
