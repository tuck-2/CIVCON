class Maker::ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    @product.company_id = current_company.id
    #製品タイプモデル作成後修正
    @product.type_id = 0
    if @product.save
      flash[:notice] = "製品の登録が完了しました"
      redirect_to maker_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.where(company_id: current_company.id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:type_id, :name, :description, product_images_images: [])
  end

end
