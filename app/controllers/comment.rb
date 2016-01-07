post '/property/:id/comments' do
	@property = Property.find(params[:id])
	@comment = @property.comments.create(description:params[:comment],user_id:current_user.id)
	redirect to "property/#{@property.id}"
end

get '/comment/:id/edit' do 
	@comment = Comment.find(params[:id])	
	#allows current user to edit comment if current user is the same as the user who created the comment
	unless current_user.id == @comment.user_id
		@error = "You cannot edit comments from another user"
		erb :"static/error"
	else
		erb :'static/edit_comment'
	end
end

patch '/comment/:id' do 
	@comment = Comment.find(params[:id])	
	@updated_com = @comment.update(params[:comment])
	@property = @comment.property
	redirect "/property/#{@property.id}"
end

delete '/comment/:id' do
	comment = Comment.find(params[:id])
	@property = comment.property

	unless current_user.id == comment.user_id
		@error= "You cannot delete other user's comments"
		erb :"static/error"
	else
		comment.destroy
		redirect "/property/#{@property.id}"
	end
end