class SearchController < ApplicationController
  def index

    #  Check if we have the two required parameters to run a search
    # if not we can simply return the view
    if (!params['q'] || ! params['searchOn'])
      return
    end

    # Set up an array to hold our results (if any)
    @results = Array.new

    # Run the search
    if params['searchOn'] == 'politician'      
      searchResults = Politician.search(params['q']) # Note search is a model method
    elsif searchOn == 'proposition'
      searchResults = Proposition.search(params['q']) # Note search is a model method
    end

    # Loop over the results and make them consistent
    searchResults.each do |searchResult|
      if searchOn == 'politician'
        result_label = searchResult.full_name
        result_link = view_context.link_to("View more", politician_path(searchResult))
      elsif searchOn == 'proposition'
        result_label = searchResult.prop_name
        result_link = view_context.link_to("View more", proposition_path(searchResult))
      end

      # Add this result ot the Array of results
      @results.push( {
        'label' => result_label, 
        'link' => result_link
      })
    end

  end

end
