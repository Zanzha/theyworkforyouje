class HomeController < ApplicationController

  def index
    @notices = Notice.order('created_at ASC').limit(1)
  end

end
