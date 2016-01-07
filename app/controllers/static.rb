get '/' do
  erb :"static/index"
end

get '/home' do
	@properties = Property.all
	erb :"static/home"
end