class SearchController < ApplicationController
  def index
    
    if !params['q']
      return
    end

    query = params['q']
    searchOn = params[searchOn]


    case searchOn
      when 'politician'
        results = Politician.searchBy(query)
        results.each.do |result|
          cleanresult = {
            'title': result.full_name,
            'link': link_to(Politician(result.id))
          }
          @results[] = cleanResult
        end
          
      when 'proposition'
        results = Proposition.searchBy(query)
        results.each.do |result|
          @results[]['title'] = result.prop_name
        end
      else
        # Nope
        @results = []
    end
  end

end
