class SavingsController < ApplicationController
  def new
    @nihonshu = Nihonshu.find(params[:nihonshu_id])
    @saving = Saving.new
  end

  def create
    @saving = Saving.new
    @review = Review.new
    @nihonshu = Nihonshu.find(params[:nihonshu_id])
    @saving.nihonshu = @nihonshu
    @saving.user = current_user
    if @saving.save
      redirect_to user_path(current_user)
    else
      # flash[:alert] = "Cant save Sake. Already saved!"
      # render 'nihonshus/show'
    end
  end

end
