class PurchaseRequisitionsController < ApplicationController
	before_action :set_purchase_requisition, only: [:show, :edit, :update, :destroy]

	def index
		@purchase_requisitions = PurchaseRequisition.all
	end
	# GET /purchase_requisition/1
	# GET /purchase_requisition/1.json
	def show
		@remit_info = RemitInfo.find(params[:remit_info_id])
		@employee = Employee.find(@remit_info.payee_id)
	end

	def update
	end
	def new
		@purchase_requisition = PurchaseRequisition.new
		@employees = Employee.all
		@requisition_employee = RequisitionEmployee.all
	end
	def create
		if params[:recorder_name].present?
			@recorder = Employee.find_by_name(params[:recorder_name])
		end
		if params[:payee_name].present?
			@employee = Employee.find_by_name(params[:payee_name])
			if @employee.present?
				@remit_info = RemitInfo.find_by_payee_id(@employee.id)
				if @remit_info.present?
					@purchase_requisition = @remit_info.purchase_requisitions.build(purchase_requisitions_params)
				    respond_to do |format|
				      if @purchase_requisition.save
				        format.html {
				            format.html { redirect_to @purchase_requisition, notice: 'User was successfully created.' }
				        }
				        redirect_to purchase_requisitions_path, notice: 'User was successfully created.'
				      else
				        format.html { render :new }
				        format.json { render json: @purchase_requisition.errors.full_messages, status: :unprocessable_entity }
				      end
					end
	    		else
	    			flash[:notice] = 'No remit_info!'
	    		end
	    	else
    			flash[:notice] = 'no Employees!'
	    	end
			redirect_to purchase_requisitions_path
	    end
	    #Rails.logger.info(@purchase_requisition.errors.full_messages.inspect) 
	end

	private
		# Use callbacks to share common setup or constraints between actions.
	    def set_purchase_requisition
	      @purchase_requisition = PurchaseRequisition.find(params[:id])
	    end
	    # Never trust parameters from the scary internet, only allow the white list through.
	    def purchase_requisitions_params
	      params.require(:purchase_requisition).permit(:name, :description, :unit, :unit_price, :amount, :total_price, :purchase_requisition_files,:requisition_employee, :remit_info_id,:payment_due_date, :payment_term, :payment_condition,employees_attributes: [:name, :job_title])
	    end
	    def employees_params
	    	params.require(:employee).permit(:name,:job_title)
	    end
end
