class CompaniesController < ApplicationController
  before_action :authenticate_company!, only: [:edit, :update]

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @products = @company.products
    @types = Type.all
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      flash[:notice] = "情報を更新しました"
      redirect_to company_path(@company.id)
    else
      render :edit
    end
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :name_kana,
      :postal_code,
      :address,
      :phone_num,
      :fax_num,
      :description
      )
  end

end
