class TransfersController < ApplicationController
  include TransfersHelper
  before_action :authenticate_user!
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = current_user.transfers.all
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = Transfer.new(transfer_params)
    @transfer.process_transaction current_user, params
    respond_to do |format|
      if @transfer.errors.blank?
        format.html { redirect_to @transfer, notice: 'Transfer was successful' }
        format.json { render :show, status: :ok, location: @transfer }
      else
        receiver = User.find params[:user_id].to_i
        receiver_account = receiver.accounts.find_by currency_type: params[:currency].downcase
        failed_transaction=Transfer.create value: params[:transfer][:value].to_f, transaction_status: false
        receiver.transfers << failed_transaction
        receiver_account.transfers << failed_transaction
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end  
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to @transfer, notice: 'Transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfers_url, notice: 'Transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = current_user.transfers.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:value, :transaction_status)
    end
end
