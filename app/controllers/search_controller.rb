class SearchController < ApplicationController

  def index
    if params["qt"]
      @topics = Offering.where(tag: params["qt"])
    end
    if params["q"]
      @organizations = Organization.by_search(params["q"])
    end
  end

end
