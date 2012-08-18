class TagsController < AdminController
  def index
    @objects = Tag.ordered
  end
end
