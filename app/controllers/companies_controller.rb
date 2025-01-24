class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
    authorize! :create, @company #if authorised then create a post
    render :new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: "company created successfully"
    else
      render :new, status: "Something went wrong"
    end
  end

  private
  
  def company_params
    params.require(:company).permit(:user_id, :name, :about)
  end

  def set_company
    @company = Company.find(params[:id])
  end
end
