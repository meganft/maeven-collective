class SearchController < ApplicationController

  def index
    if params["qt"]
      @results = Offering.search(params["qt"])
    end
    if params["q"]
      @results = Organization.by_search(params["q"])
    end
    if params[:cat] == "companies"
      @results = Organization.by_search(params["q"])
    end
    if params[:cat] == "learning"
      @results = Offering.search(params["q"])
    end
    if params[:cat] == "resources"
      @results = Offering.search(params["q"])
    end
    if params[:cat] == "events"
      @results = Offering.search(params["q"])
    end
  end

end
