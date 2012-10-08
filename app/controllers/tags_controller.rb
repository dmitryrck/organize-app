class TagsController < AdminController
  def index
    @objects = Tag.ordered
  end

  def show
    @object = Tag.find(params[:id])

    @purchases = @object.purchases.page(params[:page])
  end
end
