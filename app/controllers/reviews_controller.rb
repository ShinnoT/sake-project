class ReviewsController < ApplicationController
  # def create
  #   # @user = User.find(params[:user_id])
  #   @user = current_user
  #   @review = Review.new(review_params)
  #   @review.user = @user
  #   if @review.save
  #     redirect_to user_path(@user)
  #   else
  #     render 'users/show'
  #   end
  # end

  def create
    @nihonshu = Nihonshu.find(params[:nihonshu_id])
    @review = Review.new(review_params)
    @review.nihonshu = @nihonshu
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to nihonshu_path(@nihonshu) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'nihonshus/show' }
        format.js
      end
    end
  end

  private

  def review_params
    # params.require(:review).permit(:title, :description, :rating)
    params.require(:review).permit(:description, :rating)
  end

end
