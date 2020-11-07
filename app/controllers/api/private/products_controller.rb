class Api::Private::ProductsController < ApiController

  before_action :find_product

  def update
    @product.status = params[:status]
    if @product.save
      render json: {status: @product.status}
    else
      render_status_400
    end
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

end
