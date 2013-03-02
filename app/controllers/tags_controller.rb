class TagsController < AdminController
  def index
    @objects = Tag.ordered
  end

  def show
    @object = Tag.find(params[:id])

    @moviments = @object.moviments.page(params[:page])
  end

  private

  def object_params
    params.require(:tag).permit(:name)
  end
end
