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
    if user_signed_in?
      @estimates = current_user.estimates.all
    elsif company_signed_in?
      @estimates = current_company.estimates.all
    end
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update(estimate_params)
      flash[:notice] = "ステータスを更新しました"
      redirect_to estimate_path(@estimate.id)
    else
      render :show
    end
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
