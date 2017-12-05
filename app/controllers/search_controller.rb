class SearchController < ApplicationController
  def index
    if (!params['q'])
return
end
      @politicians = Politician.search(params['q'])
  

search_words = params['q'].split(" ")
@propositions = Proposition.order("id DESC").where('prop_name REGEXP ?',search_words.join('|')) unless search_words.blank?
@politicians = Politician.where('full_name REGEXP ?',search_words.join('|')) unless search_words.blank?

if (!params['q'])

  @propositions = @propositions.paginate(:page => params[:page])
end

    end
end