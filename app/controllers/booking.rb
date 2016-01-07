require 'byebug'

post '/property/:id/bookings' do
	@property = Property.find(params[:id])
	if current_user.id == @property.user_id
		@error = "You cannot book your own property"
		erb :"static/error"
	else
		@booking = @property.bookings.create(description:params[:booking],user_id:current_user.id)
		redirect to "/property"
	end
end

get '/booking/:id/edit' do 
	@booking = Booking.find(params[:id])	
	#allows current user to edit comment if current user is the same as the user who created the comment
	unless current_user.id == @booking.user_id
		@error= "You cannot edit bookings from another user"
		erb :"static/error"
	else
		erb :'static/edit_booking'
	end
end

patch '/booking/:id' do 
	@booking = Booking.find(params[:id])	
	@updated_com = @booking.update(params[:booking])
	# @property = @booking.property
	
	redirect "/property"
end

delete '/booking/:id' do
	@booking = Booking.find(params[:id])
	@property = @booking.property
	byebug

	unless current_user.id == @booking.user_id
		@error= "You cannot delete other user's bookings"
		erb :"static/error"
	else
		@booking.destroy
		redirect "/property"
	end
end
