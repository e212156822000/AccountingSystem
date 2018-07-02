class Employees::RemitInfosController < RemitInfosController
	before_action :set_payee

	private
		def set_payee
			@payee = Employee.find(params[:employee_id])
		end

end