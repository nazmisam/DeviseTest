class Admins::SplitsettlementsController < ApplicationController

  before_action :set_splitsettlement, only: %i[ show edit update destroy ]

  # GET /splitsettlements or /splitsettlements.json
  def index
    @splitsettlements = Splitsettlement.where(payment_id: params[:payment_id], admin_id: current_admin.id)
    
    
  end

  # GET /splitsettlements/1 or /splitsettlements/1.json
  def show
    @splitsettlements = Splitsettlement.where(account_name: params[:account_name])
  end

  # GET /splitsettlements/new
  def new
    @splitsettlement = @payment.splitsettlements.new
  end

  # GET /splitsettlements/1/edit
  def edit
  end

  # POST /splitsettlements or /splitsettlements.json
  def create
    @splitsettlement = @payment.splitsettlements.new(splitsettlement_params)

    respond_to do |format|
      if @splitsettlement.save
        format.html { redirect_to splitsettlement_url(@splitsettlement), notice: "Splitsettlement was successfully created." }
        format.json { render :show, status: :created, location: @splitsettlement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @splitsettlement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /splitsettlements/1 or /splitsettlements/1.json
  def update
    respond_to do |format|
      if @splitsettlement.update(splitsettlement_params)
        format.html { redirect_to admin_payments_splitsettlement_url(@splitsettlement), notice: "Splitsettlement was successfully updated." }
        format.json { render :show, status: :ok, location: @splitsettlement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @splitsettlement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /splitsettlements/1 or /splitsettlements/1.json
  def destroy
    @splitsettlement.destroy

    respond_to do |format|
      format.html { redirect_to admin_payment_splitsettlements_url, notice: "Splitsettlement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private


    # Use callbacks to share common setup or constraints between actions.
    def set_splitsettlement
      @splitsettlement = Splitsettlement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def splitsettlement_params
      params.require(:splitsettlement).permit(:product_id, :split_amount, :product_name, :order_number, :payment_status, :transaction_id)
    end
end
