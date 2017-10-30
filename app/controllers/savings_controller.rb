class SavingsController < ApplicationController
  def new
    @nihonshu = Nihonshu.find(params[:nihonshu_id])
    @saving = Saving.new
  end

  def create
    @saving = Saving.new
    @nihonshu = Nihonshu.find(params[:nihonshu_id])
    @saving.nihonshu = @nihonshu
    @saving.user = current_user
    if @saving.save
      redirect_to user_path(current_user)
    else
      render 'nihonshus/show'
    end
  end

end
