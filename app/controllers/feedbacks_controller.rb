class FeedbacksController < ApplicationController
   before_action :authenticate_admin!, only: [:index , :delete , :edit]
  before_action :find_feedback, only: [:edit, :update, :delete]
  def index
    @feedbacks = Feedback.order('created_at DESC')
     @feedbacks = Feedback.paginate(:page => params[:page], :per_page => 12).order('created_at DESC')
  end

  def new
    @feedback = Feedback.new
  end

  def edit
  end

  def delete
  end

  def show
  end

  def create
      @feedback = Feedback.new(feedback_params)
      if @feedback.save
        flash[:notice] = "feedback posted. Thanks!"
        redirect_to feedbacks_thank_you_path
      else
        render :new
     end
  end

    def destroy
    feedback = Feedback.find(params[:id]).destroy
    flash[:notice] = "feedback Deleted!!"
    redirect_to feedbacks_path
  end

   def feedback_params
    params.require(:feedback).permit(:user_name,:email,:subject,:message)
  end

  def find_feedback
      @feedback = Feedback.find(params[:id])
  end

end
