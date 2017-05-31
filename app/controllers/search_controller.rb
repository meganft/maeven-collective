class SearchController < ApplicationController

  def index
    if params["qt"]
      @results = Offering.search(params["qt"])
    end
    if params["q"]
      @results = Organization.by_search(params["q"])
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
    if params[:sort]
      sort_results
    end
  end

  private

  def sort_results
    if params[:az]
      if params["q"]
        @results = Organization.by_search(params["q"]).order('name ASC')
      else
        @results = Offering.search(params["qt"])
      end
    end
    if params[:za]
      @results = Organization.by_search(params["q"]).order('name DESC')
    end
  end


end
