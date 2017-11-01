class ComparisonsController < ApplicationController
skip_before_action :authenticate_user!, only: [:show]
	def show
	  @sake1 = Nihonshu.find(params[:nihonshu_id])
	  @sake2 = Nihonshu.find(params[:id])
	end
end
