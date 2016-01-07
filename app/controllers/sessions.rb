require 'byebug'

post '/signup' do 
	@user = User.new(params[:user])
		if @user.save 
			session[:user_id] = @user.id
      		redirect "/home"
    	else
      		redirect to ('/')
		end
end

post '/login' do 
	#find user's email in the database
	@user = User.find_by_email(params[:user][:email]) 
 		if @user.self_authenticate(params[:user][:password])
		session['user_id'] = @user.id
		redirect to ('/home')
	else 
		@error = "Incorrect login credentials, please check again"
		erb :"static/index"
	end
end

get '/' do
	erb :"static/index"
end

# get '/login' do
# 	erb :"static/profile"
# end

post '/logout' do
	session[:user_id] = nil
	redirect '/'
end

