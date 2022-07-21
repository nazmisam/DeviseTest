class Admins::PaymentsController < ApplicationController

  before_action :set_payment, only: %i[ show edit update destroy ]

     


  # GET /payments or /payments.json
  def index
    @payments = Payment.where(admin_id: current_admin.id)
  end

  # GET /payments/1 or /payments/1.json
  def show
    @payments = Payment.all
    @products = Product.where(params[:product_name])
  end

  # GET /payments/new
  def new  
    @payment = @product.payments.new
    @split = Split.find_by(product_id: params[:product_id], role: 'Main Seller')
    @product = Product.find_by(params[:name])
    Rails.logger.debug "Cariberjaya #{@split}"
    @payment.generate_order_number
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)
    @split = Split.where(product_id: params[:product_id])
    @payment.generate_order_number
    
    
    if @payment.save
      Rails.logger.debug("testing #{@payment.generate_checksum}")
      params_api = {
        uid: "02b66d73-c60f-47e6-a07c-0aa3609ddddd",
        checksum: @payment.generate_checksum,
        buyer_email: @payment.buyer_email,
        buyer_name: @payment.buyer_name,
        buyer_phone: @payment.buyer_phone,
        order_number: @payment.order_number,
        product_description: @product.name,
        transaction_amount: @payment.total_pay,
        callback_url: "",
        redirect_url: "http://localhost:3000/users/products/#{@product.id}/payments/paymentredirect",
        token: "ZiSzpYWJ4VY5xhb1W7M9",
        redirect_post: "true"
      }
      redirect_post("https://sandbox.securepay.my/api/v1/payments",            # URL, looks understandable
        params: params_api)
    else
      Rails.logger.debug "Failed to save"
    end

  end

  def paymentredirect
   
    user = User.find_by(email: params[:buyer_email])
    
    payment_status = params[:payment_status]
    
    @payment = Payment.find_by(buyer_email: params[:buyer_email], buyer_name: params[:buyer_name])
    if payment_status == "true"
      sign_in(user) if user.present?
      @payment.update(status: 'Paid')
      redirect_to user_products_path(id: @payment.id, product_id: @product.id), notice: "Payment Success!"

    end
  end
  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to product_payments_url(@payment), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to product_payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
     
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:order_number, :account_name, :total_pay, :buyer_name, :buyer_email, :buyer_address, :buyer_phone, :product_id, :product_name)
    end
  
end
