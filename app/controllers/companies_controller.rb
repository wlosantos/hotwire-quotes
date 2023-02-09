class CompaniesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
