require 'flickr'

class StaticPagesController < ApplicationController
  def index
    @user_id = user_id
    flickr = Flickr.new ENV['FLICKR_KEY'], ENV['FLICKR_SECRET']
    response = flickr.photos.search(user_id: @user_id)
    @photos = response.map do |p|
      "https://farm#{p.farm}.staticflickr.com/#{p.server}/#{p.id}_#{p.secret}.jpg"
    end
  end

  def create
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end

  private

    def user_id
      user_id = if session[:user_id] == ""
                  "otter"
                else
                  session[:user_id]
                end
    end
end
