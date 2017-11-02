class NihonshusController < ApplicationController

 skip_before_action :authenticate_user!, only: [:index, :search, :show, :search_attr]

  def index
    #request.path == "/nihonshus/:nihonshu_id/nihonshus"
    # @regex_path = /\/nihonshus\/\d\/nihonshus/ =~ request.path
    # unless @regex_path == ( nil || 0 )
    if params[:nihonshu_id]
      @nihonshu1 = Nihonshu.find(params[:nihonshu_id])
      # @nihonshus = Nihonshu.all
      @nihonshus =
      if search_params
        redirect_to nihonshu_search_path(@nihonshu1, resource_object, search: search_params)
      else
        Nihonshu.all[0..5]
      end
      # @nihonshus =
      # if search_params
      #   redirect_to nihonshu_search_path(@nihonshu1, resource_object, search: search_params)
      # else
      #   nil
      # end
    else
      @nihonshus =
      if search_params
        redirect_to search_path(resource_object, search: search_params)
      else
        nil
      end
    end

# NEEEMAAAA
    # @nihonshus = Nihonshu.all
    # @nihonshus =
    # if search_params
    #   redirect_to search_path(resource_object, search: search_params)
    # else
    #   nil
    # end
# NEEEEEMAAAAA

  end

  def search_attr
    # search by price&taste&rating
    @nihonshus = Nihonshu.search_attr(params[:query_taste], params[:query_price1], params[:query_price2], params[:query_rating])
  end

  def search
    # search by navbar(all)
    if params[:nihonshu_id]
      @nihonshu1 = Nihonshu.find(params[:nihonshu_id])
      @nihonshus =
      unless search_params.nil?
        Nihonshu.search(search_params)
      else
        Nihonshu.all
      end
    else
      @nihonshus =
      unless search_params.nil?
        Nihonshu.search(search_params)
      else
        Nihonshu.all
      end
    end
  end

# def show
#   @nihonshu = Nihonshu.find(params[:id])
#   @review = Review.new
# end


  def show
    # if current_page?(nihonshu_nihonshu_path(params[:nihonshu_id], params[:second_id]))
    # if request.path == "/nihonshus/:nihonshu_id/nihonshus/:second_id"
    # @regex_path = /\/nihonshus\/\d\/nihonshus\/\d/ =~ request.path
    # unless @regex_path == ( nil || 0 )
    if params[:second_id]
      @nihonshu1 = Nihonshu.find(params[:nihonshu_id])
      @nihonshu2 = Nihonshu.find(params[:second_id])
      redirect_to nihonshu_nihonshu_comparisons_path(@nihonshu1, @nihonshu2)
    else
      @nihonshu = Nihonshu.find(params[:id])
      @review = Review.new
      @saving = Saving.new
      if @nihonshu.reviews.empty?
        @average_rating = 0
      else
        @ratings = @nihonshu.reviews.map { |review| review.rating.to_i }
        @average_rating = (@ratings.inject(:+)) / (@ratings.length)
      end
    end
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
