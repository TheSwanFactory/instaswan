class WelcomeController < ApplicationController
  def index
    @photos = Photo.all
    @user = current_user
  end
end
