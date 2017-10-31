class ComparisonsController < ApplicationController
	# def show
	#   @sake1 = Nihonshu.find(params[:nihonshu_id])
	#   @sake2 = Nihonshu.find(params[:id])
	# end

  def display
    @sake1 = Nihonshu.find(params[:nihonshu_id])
    @sake2 = Nihonshu.find(params[:nihonshu_second_id])
  end
end
