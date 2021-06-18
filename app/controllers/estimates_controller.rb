class EstimatesController < ApplicationController
  def new
    @estimate = Estimate.new
    @product = Product.find(params[:product_id])
  end

  def create
    @estimate = Estimate.new(estimate_params)
    @estimate.user_id = current_user.id
    product = Product.find(params[:product_id])
    @estimate.company_id = product.company.id
    @estimate.product_id = product.id
    if @estimate.save
      flash[:notice] = "見積依頼を送信しました"
      redirect_to estimates_path
    else
      render :new
    end

  end

  def index
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def estimate_params
    params.require(:estimate).permit(
      :description,
      :status
      )
  end

end
