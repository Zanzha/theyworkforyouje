class SearchController < ApplicationController
  def index

    #  Check if we have the two required parameters to run a search
    # if not we can simply return the view
    if (!params['q'])
      return
    end

    # Set up an array to hold our results (if any)
    @results = Array.new

    # Run the search     
      searchResults = Politician.search(params['q']) # Note search is a model method

    # Loop over the results and make them consistent
    searchResults.each do |searchResult|
      result_label = searchResult.full_name
      result_link = view_context.link_to("View more", politician_path(searchResult))

      # Add this result ot the Array of results
      @results.push( {
        'label' => result_label, 
        'link' => result_link
      })

    end
  end
end
