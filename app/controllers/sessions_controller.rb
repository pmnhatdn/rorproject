class SessionsController < ApplicationController
	
	#render signin form
	def new
		render 'new'
	end
	
	#Signin : create a new session
	def create				
		user =User.authenticate(params[:session][:username],params[:session][:password])		
		if user 			
			sign_in user			
			#redirect_to user, :notice => "Login successfully"
			redirect_back_or user
			
	  	else
	        flash[:error] = 'Invalid username or password'
	 		render 'new'
	    end  		  
	
	end
	
	#Signout: call sign_out from sessionhelper
	def destroy
  		sign_out
  		flash[:error] = signed_in?
	  	new  	  	
	end
end
