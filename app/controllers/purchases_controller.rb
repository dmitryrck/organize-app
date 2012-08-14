class PurchasesController < AdminController
  def index
    if params[:year].present? && params[:month].present?
      @period = Period.new(params[:year], params[:month])
    else
      @period = Period.new(Date.current.year, Date.current.month)
    end
    @objects = Purchase.by_period(@period)
  end
end
