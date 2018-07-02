class Companies::RemitInfosController < RemitInfosController
	before_action :set_payee

	private
		def set_payee
			@payee = Company.find(params[:company_id])
		end

end