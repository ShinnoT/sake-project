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
  end

  private

  def search_params
    unless params[:search].nil?
      params[:search].downcase.capitalize
    end
  end
end
