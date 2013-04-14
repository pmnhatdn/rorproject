class EntriesController < ApplicationController
before_filter :signed_in_check, only: [ :create, :destroy]  
  def create
  	@entry = current_user.entries.build(params[:entry])
    if @entry.save
      flash[:result] = "Posted successfully!"     
      
    else      	        
      @feed_items = []
      flash[:result] = "Posted unsuccessfullly! "
    end    
    redirect_to blog_path
  end   

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to blog_path }
      format.json { head :no_content }
    end
  end
end
