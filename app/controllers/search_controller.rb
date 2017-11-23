class SearchController < ApplicationController
  def index
    if (!params['q'])
      return
    end
      @politicians = Politician.search(params['q'])
      @propositions = Proposition.search(params['q']).paginate(:page => params[:page])
    end
end