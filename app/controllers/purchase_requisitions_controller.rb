class PurchaseRequisitionsController < ApplicationController
	before_action :set_purchase_requisition, only: [:show, :edit, :update, :destroy]

	def index
		@purchase_requisitions = PurchaseRequisition.all
		#@employees = Employee.all(:all)
	end
	# GET /purchase_requisition/1
	# GET /purchase_requisition/1.json
	def show
		@remit_info = RemitInfo.find(@purchase_requisition.remit_info_id)
		@payee = Employee.find(@remit_info.payee_id)
		@employees = @purchase_requisition.employees
	end

	def update
	end
	def new
		@purchase_requisition = PurchaseRequisition.new
		@requisition_employees = @purchase_requisition.requisition_employees.new
    	#@employee = @requisition_employees.employees.build
		#@purchase_requisition.requisition_employees.build(employee_type: 'recorder').build_employee
		# @requisition_employee = RequisitionEmployee.new
	end
	def create
		if params[:recorder_name].present? && params[:payee_name].present?
			@recorder = Employee.find_by_name(params[:recorder_name])
			@employee = Employee.find_by_name(params[:payee_name])
			if @recorder.present? && @employee.present?
				#這一句有問題
				#@requisition_employees = @recorder.purchase_requisitions.build
				#@purchase_requisition.employee_ids = params[:employee_ids]
				@remit_info = RemitInfo.find_by_payee_id(@employee.id)
				if @remit_info.present?
					@purchase_requisition = @remit_info.purchase_requisitions.build(purchase_requisitions_params)
				    #:purchase_requisition_id => @purchase_requisition.id ,:employee_id => @recorder.id , :employee_type => "recorder"
				    respond_to do |format|
				    if @purchase_requisition.save
				      	#來存employee
						#many to many :through
						# p = PurchaseRequisition.last
						#re = @purchase_requisition.requisition_employees.build.build_employee(requisitions_employees_params)
						re = @purchase_requisition.requisition_employees.build(requisitions_employees_params)
						#@purchase_requisition.employees = [@recorder]
						if re.save
				        	format.html {
				         	   format.html { redirect_to @purchase_requisition, notice: ' was successfully created.' }
				        	}
				        	redirect_to purchase_requisitions_path, notice: @purchase_requisition.id.to_s + 'Data was successfully created.'  #+ params[:employee_ids][1].to_s
				      	else
				      		flash[:notice] = 'Not saving!' + re.errors.full_messages.to_s
				        	format.html { render :new }
				        	format.json { render json: @purchase_requisition.errors.full_messages, status: :unprocessable_entity }
			      		end
			      	end
				end
	    		else
	    			flash[:notice] = 'No remit_info!'
	    		end
	    	else
    			flash[:notice] = 'no Employees!'
	    	end
		else
			flash[:notice] = 'No filling 申請人/記錄人!'
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
	      		:name, 
	      		:description, 
	      		:unit, 
	      		:unit_price, 
	      		:amount, 
	      		:total_price, 
	      		:purchase_requisition_files,
	      		:requisition_employees,
	      		:remit_info_id,
	      		:payment_due_date, 
	      		:payment_term,
	      		:payment_condition,
	      		employees_attributes: [:name, :job_title]
	      )
	    end
	    def employees_params
	    	params.require(:employee).permit(:name,:job_title)
	    end
	    def requisitions_employees_params
	    	params.require(:requisition_employee).permit(:purchase_requisition_id,:employee_id, :employee_type)
	    end
end
