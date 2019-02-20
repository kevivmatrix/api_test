class Api::CustomersController < ApplicationController

  SECRET_KEY = "secret"
  skip_before_action :verify_authenticity_token
  before_action :verify_secret_key

  def index
    @customers = Customer.all
   
    respond_to do |format|
      format.json  { render json: @customers, each_serializer: CustomerSerializer }
    end
  end

  def create
    @customer = Customer.new(customer_params)
   
    respond_to do |format|
      if @customer.save
        format.json  { render json: @customer, serializer: CustomerSerializer,
                      status: :created }
      else
        format.json  { render json: @customer.errors,
                      status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
   
    respond_to do |format|
      format.json { render json: { success: true } }
    end
  end

  private

  def verify_secret_key
    if params[:secret] != SECRET_KEY
      head :unauthorized
      return
    end
  end

  def customer_params
    params.permit(:name, :address_id)
  end

end
