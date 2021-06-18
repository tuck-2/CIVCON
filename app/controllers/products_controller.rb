class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.sizes.build
    @product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    @product.company_id = current_company.id
    if @product.save
      flash[:notice] = "製品の登録が完了しました"
      redirect_to company_path(current_company.id)
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @sizes = @product.sizes
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(
      :type_id,
      :name,
      :description,
      sizes_attributes: [
        :id,
        :product_id,
        :name,
        :_destroy
        ],
      product_images_images: []
      )
  end

end
