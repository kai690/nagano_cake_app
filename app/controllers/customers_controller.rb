class CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(current_customer), notice:'変更が保存されました'
    else
      render:edit
    end
  end

  def unsubscribe

  end
  def deactivate
    @customer = current_customer
    if @customer.update(unsubscribe_params)
      redirect_to root_path
    else
      render:unsubscribe
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number,:is_active)
  end
  def unsubscribe_params
    params.permit(:is_active)
  end
end
