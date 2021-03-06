class ProductsController < ApplicationController
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy]

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
    @types = Type.all
  end

  def show
    @product = Product.find(params[:id])
    @sizes = @product.sizes
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "製品情報を更新しました"
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "製品を削除しました"
    redirect_to company_path(current_company.id)
  end

  def download
    @product = Product.find(params[:id])
    send_data(@product.drawing.read, filename: @product.drawing_identifier)
  end

  def search
    if params[:word].present?
      @products = Product.where('name LIKE ?', "%#{params[:word]}%")
    else
      @products = Product.none
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :type_id,
      :name,
      :description,
      :drawing,
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
