class TagsController < AdminController
  def index
    @objects = Tag.ordered
  end

  def show
    @object = Tag.find(params[:id])

    @movimentations = @object.movimentations.page(params[:page])
  end
end
