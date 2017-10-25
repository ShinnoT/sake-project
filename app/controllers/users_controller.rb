class UsersController < ApplicationController
  def show
    # @user = User.find(params[:id])
    @user = current_user
    # @user_sake = @user.nihonshus#index
    @reviews = Review.all
  end
end
