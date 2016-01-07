require 'byebug'

get '/property' do 
	@properties = Property.all
	@user_properties = current_user.properties
	@bookings = Booking.all
	@user_bookings = current_user.bookings
	erb :"static/profile"
end

post '/property' do
	@property = Property.new(description: params[:property][:description],user_id:current_user.id)
	if @property.save
		redirect "/property/#{@property.id}"
	else
		erb :"static/profile"
	end
end

get '/property/:id' do
	@spec_property = Property.find(params[:id])
	@comments = Comment.all
	@bookings = Booking.all
	@property_comments = @spec_property.comments
	@property_bookings = @spec_property.bookings
	erb :"static/spec_property"
end

# To edit/update specific properties
get '/property/:id/edit' do 
	@property = Property.find(params[:id])	
	erb :'static/edit_property'
end

patch '/property/:id/edit' do 
	@property = Property.find(params[:id])	
	@property.update(params[:property])

	redirect "/property/#{@property.id}"
end

delete '/property/:id' do
	property = Property.find(params[:id])
	property.destroy

	redirect "/property"
end

	
