class Admin::CustomersController < ApplicationController
layout 'admin'

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice:'変更が保存されました'
    else
      render:edit
    end
  end

  def show_order
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :is_active)
  end

end
