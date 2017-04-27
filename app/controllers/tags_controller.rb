class TagsController < ApplicationController

  def index
    @topics = Tag.all
  end

end
