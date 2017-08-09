class ProductsController < ApplicationController
  load_and_authorize_resource except: [:add_to_cart]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
  end

  # # GET /products/1

  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # # GET /products/1/edit
  # def edit
  # end

  # POST /products
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def process_import
    begin
      file = File.read(params[:products][:file].path)
      data_hash = JSON.parse(file)
      Product.transaction { Product.create(data_hash['products']) }

      flash[:success] = 'Products have been imported'
      redirect_to products_path
    rescue Exception => e
      flash[:error] = e.message
      render 'import_products'
    end
  end

  def add_to_cart
    product_id = params[:id]
    cart = Cart.new(session)
    cart.add_item_to_cart(product_id)

    respond_to do |format|
      format.json { render json: { total_number: cart.total_items }, status: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :brand, :model, :sku, :price, :desc)
    end
end
