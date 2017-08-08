class  Api::V1::ProductsController < Api::V1::ApiController
  before_action :set_product, only: [:show]

  # GET /products
  def index
    @products = Product.all
  end

  # GET /products/1
  def show
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.json { render :show, status: :created, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_price
    @product = Product.find_by_id(params[:product_id])
    respond_to do |format|
      if @product.update_attribute(:price, params[:price])
        format.json { render :show, status: :updated, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :brand, :model, :sku, :price, :desc)
  end
end
