class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  # GET /products
  def index
    @search = Product.ransack(params[:q])
    @search.sorts = 'id asc'
    @products = @search.result.page(params[:page]).per(params[:per])
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url, notice: 'Product was successfully created.' and return
    else
      render :new and return
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to products_url, notice: 'Product was successfully updated.' and return
    else
      render :edit and return
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.' and return
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.fetch(:product, {}).permit(:name, :status)
    end
end
