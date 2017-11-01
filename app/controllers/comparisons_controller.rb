class ComparisonsController < ApplicationController
	# def show
	#   @sake1 = Nihonshu.find(params[:nihonshu_id])
	#   @sake2 = Nihonshu.find(params[:id])
	# end

  def display
    @sake1 = Nihonshu.find(params[:nihonshu_id])
    @sake2 = Nihonshu.find(params[:nihonshu_second_id])
    @rating1 = @sake1.reviews.empty? ? 0 : @sake1.reviews.first.rating
    @rating2 = @sake2.reviews.empty? ? 0 : @sake2.reviews.first.rating
  end
end
