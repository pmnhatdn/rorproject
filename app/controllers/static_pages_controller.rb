class StaticPagesController < ApplicationController
  def home
  end

  def blog  	
  	if signed_in?
  		@entry = current_user.entries.build 
  		@feed_items = current_user.feed.paginate(page: params[:page],:per_page => 6) 
  	end
  	
  end

  def help
  end
end
