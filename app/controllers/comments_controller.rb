class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@photo = Photo.find(params[:photo_id])
  	@comments = Comment.where(photo_id: params[:photo_id])
  end


  def new
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.new
  end

  def create
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.new(comment_params)
  	@comment.user = current_user
  	@comment.photo = @photo

  	if @comment.save
  		redirect_to photos_path, notice: "Your reply has been saved"
  	end

  end

  def comment_params
  	params.require(:comment).permit(:body)
end



end
#because this is a nested route, the find params becomes photo_id instead of just params[:id]
