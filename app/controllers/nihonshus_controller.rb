class NihonshusController < ApplicationController
 skip_before_action :authenticate_user!, only: [:index, :search]

 def search
  @nihonshus = Nihonshus.all

  if params[:search]
    @nihonshus = Nihonshus.search(params[:search])
  else
    @nihonshus = Nihonshus.all
  end
end

def index
  @Nihonshus = Nihonshus.all
end
end
