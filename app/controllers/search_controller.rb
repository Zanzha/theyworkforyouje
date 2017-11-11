class SearchController < ApplicationController
  def index

    #  Check if we have the two required parameters to run a search
    # if not we can simply return the view
    if (!params['q'])
      return
    end

    # Set up an array to hold our POLOTICIAN results (if any)
    @pol_results = Array.new

    # Run the search
      polResults = Politician.search(params['q']) # Note search is a model method

    # Loop over the results and make them consistent
    polResults.each do |polResult|
      pol_result_label = polResult.full_name
      pol_result_title = polResult.title
      pol_result_link = view_context.link_to("View more", politician_path(polResult))

      # Add this result ot the Array of results
      @pol_results.push({
        'label' => pol_result_label, 
        'title' => pol_result_title, 
        'link' => pol_result_link
      })
    end


      # Set up an array to hold our PROPOSITION results (if any)
      @prop_results = Array.new
      
      # Run the search     
        propResults = Proposition.search(params['q']) # Note search is a model method
  
      # Loop over the results and make them consistent
      propResults.each do |propResult|
        prop_result_label = propResult.prop_name
        prop_result_proposer = propResult.lodged_by
        prop_result_link = view_context.link_to("View more", proposition_path(propResult))
  
        # Add this result ot the Array of results
        @prop_results.push({
          'label' => prop_result_label, 
          'proposer' => prop_result_proposer, 
          'link' => prop_result_link
        })
      end

  end
end
