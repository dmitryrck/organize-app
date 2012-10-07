class TagsController < AdminController
  def index
    @objects = Tag.ordered
  end

  def show
    @object = Tag.find(params[:id])

    @purchases = @object.purchases.paginate(:page => params[:page], :size => 10)
  end
end
