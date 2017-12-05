class SearchController < ApplicationController
  def index
    if (!params['q'])
return
end
      @politicians = Politician.search(params['q'])
  

search_words = params['q'].split(" ")
@propositions = Proposition.order("id DESC").where('prop_name REGEXP ?',search_words.join('|')) unless search_words.blank?
@politicians = Politician.where('full_name REGEXP ?',search_words.join('|')) unless search_words.blank?

@propositions = @propositions.paginate(:page => params[:page])

<<<<<<< HEAD
      # Add this result ot the Array of results
      @pol_results.push({
        'label' => pol_result_label, 
        'title' => pol_result_title, 
        'link' => pol_result_link
      })
    end


      # Set up an array to hold our PROPOSITION results (if any)
      @prop_results = Array.new
      
      # Run the search & Limits search results.
        propResults = Proposition.search(params['q']).page params[:page] # Note search is a model method
  
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

      @meta_results = @prop_results.concat(@pol_results)
      # @meta_results = @meta_results.page params[:page]

  end
end
=======
    end
end
>>>>>>> develop
