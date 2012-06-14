
class CommentsController < ApplicationController
  before_filter :login_required
  
  
  def create
    @person = Person.find(params[:person_id])
    @comment = @person.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      redirect_to person_path(@person)
    end
  end
  

  # remove a comment
  def destroy
    @comment = current_user.comments.find(params[:id])
    @person = Person.find(params[:person_id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @person }
    end
  end
  
  
end
