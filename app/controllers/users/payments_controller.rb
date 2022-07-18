class Users::PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only=>[:paymentredirect]
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

    @split.each do |split|
      @payment = Payment.new(payment_params)
      @payment.total_pay = split.split_total
      @payment.account_name = split.account
      @payment.save
      Rails.logger.debug "successfull save #{@payment.account_name}"
    end
  end

  def paymentredirect
   
    user = User.find_by(email: params[:buyer_email])
    
    payment_status = params[:payment_status]
    
    @payment = Payment.find_by(buyer_email: params[:buyer_email], buyer_name: params[:buyer_name])
    if payment_status == "true"
      sign_in(user) if user.present?
      redirect_to user_products_path(id: @payment.id, product_id: @product.id), notice: "Payment Success!"

        
        # else
        #     Rails.logger.debug("this is public")
        #     ReceiptEventMailer.with(participant: @participant).post_created.deliver_now
        #     redirect_to event_onboard_payments_path(id: @participant.id,event_id: @participant.event_id), notice: "Payment Success!"
        # end
    # else
        # Rails.logger.debug "status failed #{participant_status}"
        # redirect_to event_onboard_payment_register_path(@participant.event_id, :event_id => @participant.event_id), alert: "Payment Unsuccessful!"
        # flash[:alert] = 'Payment Failed!'
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
      params.require(:payment).permit(:product_number, :account_name, :total_pay, :buyer_name, :buyer_email, :buyer_address, :buyer_phone, :product_id, :product_name)
    end
  
end