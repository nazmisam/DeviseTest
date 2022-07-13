class Users::PaymentsController < ApplicationController
  before_action :get_product
  before_action :set_payment, only: %i[ show edit update destroy ]

     


  # GET /payments or /payments.json
  def index
    @payments = @product.payments
  
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new  
    @payment = @product.payments.new
    
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)
    @split = Split.where(product_id: params[:product_id])
    @split.each do |split|
      @payment.total_pay = split.split_total
      @payment.save
    end
    @payment = Payment.new(payment_params)
    if @payment.save
      Rails.logger.debug("testing #{@payment.generate_checksum}")
      params_api = {
        uid: "02b66d73-c60f-47e6-a07c-0aa3609ddddd",
        checksum: @payment.generate_checksum,
        buyer_email: @payment.buyer_email,
        buyer_name: @payment.buyer_name,
        buyer_phone: @payment.buyer_phone,
        order_number: @payment.id,
        product_description: @product.name,
        transaction_amount: @payment.total_pay,
        callback_url: "",
        redirect_url: "",
        token: "ZiSzpYWJ4VY5xhb1W7M9",
        redirect_post: "true"
      }
      redirect_post("https://sandbox.securepay.my/api/v1/payments",            # URL, looks understandable
        params: params_api)
    else
      Rails.logger.debug "Failed to save"
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

    def get_product
      @product = Product.find(params[:product_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = @product.payments.find(params[:id])
     
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:total_pay, :buyer_name, :buyer_email, :buyer_address, :buyer_phone, :product_id)
    end
  
end