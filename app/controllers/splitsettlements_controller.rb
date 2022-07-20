class SplitsettlementsController < ApplicationController
  before_action :set_splitsettlement, only: %i[ show edit update destroy ]

  # GET /splitsettlements or /splitsettlements.json
  def index
    @splitsettlements = Splitsettlement.all
  end

  # GET /splitsettlements/1 or /splitsettlements/1.json
  def show
  end

  # GET /splitsettlements/new
  def new
    @splitsettlement = Splitsettlement.new
  end

  # GET /splitsettlements/1/edit
  def edit
  end

  # POST /splitsettlements or /splitsettlements.json
  def create
    @splitsettlement = Splitsettlement.new(splitsettlement_params)

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
        format.html { redirect_to splitsettlement_url(@splitsettlement), notice: "Splitsettlement was successfully updated." }
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
      format.html { redirect_to splitsettlements_url, notice: "Splitsettlement was successfully destroyed." }
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
      params.require(:splitsettlement).permit(:account_name, :product_id, :split_amount, :product_name, :order_number, :payment_status, :transaction_id)
    end
end
