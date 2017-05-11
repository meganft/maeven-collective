class SearchController < ApplicationController

  def index
    if params["qt"]
      @topics = Offering.search(params["qt"])
    end
    if params["q"]
      @organizations = Organization.by_search(params["q"])
    end
  end

end
