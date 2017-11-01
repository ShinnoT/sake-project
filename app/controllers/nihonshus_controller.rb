class NihonshusController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :search, :search_attr]

  def index
    @nihonshus = Nihonshu.all
    # @nihonshus =
    # if search_params
    #   redirect_to search_path(resource_object, search: search_params)
    # else
    #   nil
    # end
  end

  def search_attr
    # search by price&taste&rating
    @nihonshus = Nihonshu.search_attr(params[:query_taste], params[:query_price1], params[:query_price2], params[:query_rating])
  end

  def search
    # search by navbar(all)
    @nihonshus =
    unless search_params.empty?
      Nihonshu.search(search_params)
    else
      Nihonshu.all
    end
  end

  def show
    @nihonshu = Nihonshu.find(params[:id])
    @review = Review.new
    @saving = Saving.new
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
