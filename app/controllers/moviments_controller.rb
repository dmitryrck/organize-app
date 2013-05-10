class MovimentsController < AdminController
  def index
    if params[:term].present?
      @objects = Moviment.search(params[:term])
    else
      if params[:year].present? && params[:month].present?
        @period = Period.new(params[:year], params[:month])
      else
        @period = Period.new(Date.current.year, Date.current.month)
      end

      @objects = Moviment.by_period(@period)
    end
  end

  private

  def object_params
    params.require(:moviment).permit(:title,
      :purchased_at, :expires_in, :tag_id, :observation, :kind, :value)
  end
end
