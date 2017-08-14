class SearchController < ApplicationController

  def index
    if params["qt"] && params["q"] == ""
      @results = Offering.search(params["qt"])
    end
    if params["q"] && params["qt"] == ""
      @results = Organization.by_search(params["q"])
    end
    if params[:cat] == "companies"
      @results = Organization.by_search(params["q"])
    end
    if params[:cat] == "learning"
      @results = Offering.search(params["q"])
    end
    if params[:cat] == "learning" && params[:filter]
      if params[:filter] == "format"
        if params[:format] == "conference"
          @results = Offering.search(params["q"]).where(format: "Conference")
        end
      end
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
    if params[:sort] == "az"
      if params["qt"] && params["q"] == ""
        @results = Offering.search(params["qt"]).order('offerings.name ASC')
      else
        @results = Organization.by_search(params["q"]).reverse
      end
    end
    if params[:sort] == "za"
      if params["qt"] && params["q"] == ""
        @results = Offering.search(params["qt"]).order('offerings.name DESC')
      else
        @results = Organization.by_search(params["q"])
      end
    end
    if params[:sort] == "price"
      if params["qt"] && params["q"] == ""
        @results = Offering.search(params["qt"]).order('offerings.price DESC')
      else
        @results = Organization.by_search(params["q"])
      end
    end
    if params[:sort] == "new"
      if params["qt"] && params["q"] == ""
        @results = Offering.search(params["qt"])
      else
        @results = Organization.by_search(params["q"])
      end
    end
  end


end
