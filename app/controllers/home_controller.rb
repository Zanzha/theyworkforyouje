class HomeController < ApplicationController

  def index
    @notices = Notice.order('created_at DESC').limit(3)
  end

end
