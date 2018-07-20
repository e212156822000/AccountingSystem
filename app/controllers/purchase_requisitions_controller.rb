class PurchaseRequisitionsController < ApplicationController
	before_action :set_purchase_requisition, only: [:show, :edit, :update, :destroy]

	def index
		@purchase_requisitions = PurchaseRequisition.all
	end
	# GET /purchase_requisition/1
	# GET /purchase_requisition/1.json
	def show
		@remit_info = RemitInfo.find(@purchase_requisition.remit_info_id)
		@payee = set_payee_by_payee_id(@remit_info.payee_id,@remit_info.payee_type)
		@recorder = Employee.find(@purchase_requisition.recorder_id)
		@company = Company.find(@purchase_requisition.company_id)
	end

	def update
	end
	def new
		@purchase_requisition = PurchaseRequisition.new
	end
	def create
		if params[:recorder_id].present? && 
		   params[:purchase_requisition][:remit_infos][:name].present?
			# 現在是用string直接去找東西，找不到會爆掉，之後要改成view可以直接傳id過來
			set_payee_by_payee_type(params[:purchase_requisition][:remit_infos][:name],params[:payee_type])
			#@recorder = Employee.find(params[:recorder_id])
			@company = Company.find_by_name(params[:company_name])
			if @payee.present? && @company.present?
				@remit_info = RemitInfo.find_by_payee_id(@payee.id)
				params[:purchase_requisition][:recorder_id] = params[:recorder_id]
				params[:purchase_requisition][:company_id] = @company.id
				if @remit_info.present?
					@purchase_requisition = @remit_info.purchase_requisitions.build(purchase_requisitions_params)
				    respond_to do |format|
				    if @purchase_requisition.save
				      	format.html {
			         	   format.html { redirect_to @purchase_requisition, notice: ' was successfully created.' }
			        	}
			        	redirect_to purchase_requisitions_path, notice: @purchase_requisition.id.to_s + 'Data was successfully created.' + params[:recorder_id].to_s
			      	else
			      		flash[:notice] = 'Not saving!'  + @purchase_requisition.errors.full_messages.to_s
			        	format.html { render :new }
			        	format.json { render json: @purchase_requisition.errors.full_messages, status: :unprocessable_entity }
		      	  	end
				end
	    		else
	    			flash[:notice] = 'No remit_info!'
	    		end
	    	else
    			flash[:notice] = 'no Employees or no Company. ' + params[:purchase_requisition][:remit_infos][:name]
	    	end
		else
			flash[:notice] = 'No filling 申請人/記錄人.'
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
	      params.require(:purchase_requisition).permit(
	      		:company_id,
	      		:name, 
	      		:description, 
	      		:unit, 
	      		:unit_price, 
	      		:amount, 
	      		:total_price, 
	      		:purchase_requisition_files,
	      		:requisition_employees,
	      		:recorder_id,
	      		:remit_info_id,
	      		:payment_due_date, 
	      		:payment_term,
	      		:payment_condition,
	      		remit_infos_attributes: [:name, :bank_name, :bank_code, :branch_bank_code, :account_number]
	      )
	    end
	    def employees_params
	    	params.require(:employee).permit(:name,:job_title)
	    end
	    def requisitions_employees_params
	    	params.require(:requisition_employee).permit(:purchase_requisition_id,:employee_id, :employee_type)
	    end
	    def set_payee_by_payee_type(payee_name,payee_type)
	    	if(payee_type == "Employee")
				@payee = Employee.find_by_name(payee_name)
	    	else
	    		@payee = Company.find_by_name(payee_name)
	    	end
	    end
	    def set_payee_by_payee_id(payee_id,payee_type)
	    	if(payee_type == "Employee")
				payee = Employee.find(payee_id)
	    	else
	    		payee = Company.find(payee_id)
	    	end
	    	return payee
	    end
	    helper_method :set_payee_by_payee_id
end
