class NihonshusController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :search]

  def index
    @nihonshus =
      if search_params
        redirect_to search_path(resource_object, search: search_params)
      else
        nil
      end
  end

  def search
    # @nihonshus = Nihonshu.all
    @nihonshus =
      unless search_params.empty?
        Nihonshu.search(search_params)
      else
        nil
      end
  end

  def show
    @nihonshu = Nihonshu.find(params[:id])
    @review = Review.new
  end

  def get_barcode
     @nihonshu = Nihonshu.find_or_initialize_by(sku: params[:sku])
     print @nihonshu
     unless @nihonshu.new_record?
       # redirect_to nihonshu_path(@nihonshu)
      render json: {target_url: nihonshu_path(@nihonshu)}
     else
      # redirect_to user_path(current_user)
      render json: {target_url: root_path}
     end
   end


  private

  def search_params
    unless params[:search].nil?
      params[:search].downcase.capitalize
    end
  end
end
