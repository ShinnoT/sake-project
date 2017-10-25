class NihonshusController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :search]

  def index
    @nihonshus =
      if params[:search]
        redirect_to search_path(resource_object, search: params[:search])
      else
        nil
      end
  end

  def search
    # @nihonshus = Nihonshu.all
    @nihonshus =
      unless params[:search].empty?
        Nihonshu.search(params[:search])
      else
        nil
      end
  end
end
