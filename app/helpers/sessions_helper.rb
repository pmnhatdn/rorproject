module SessionsHelper
	
	#save current user when login + cookie	
	def sign_in(user)
		cookies[:remember_token] = { value:user.remember_token,expires: 20.years.from_now.utc }
		self.current_user=user
	end
	

	def current_user=(user)
    	@current_user = user
	end
#	def signed_in_user
#	   unless signed_in?
#	      redirect_to signin_url, notice: current_user
#	   end
#	end

	#check for models filer
	def signed_in_check
	   unless signed_in?
	      redirect_to signin_url, notice: current_user
	   end
	end
	#get current user
	def current_user
    	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  	end
  	
  	#sign out
  	def sign_out
  		self.current_user=nil
  		cookies.delete(:remember_token)
  	end

  	# redirect to the previous ...
  	def redirect_back_or(default)
    	redirect_to(session[:return_to] || default)
    	session.delete(:return_to)
  	end

  	#check whether use logged in or not
  	def signed_in?
    	!current_user.nil?
	end
	
	
	def current_user?(user)
    	user == current_user
  	end
  	
  	def store_location
    	session[:return_to] = request.url
  	end
  
  
end
	