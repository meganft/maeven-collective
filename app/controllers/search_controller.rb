class SearchController < ApplicationController

  def index
    @organizations = Organization.by_search(params["q"])
  end

end
