class RemitInfosController < ApplicationController

	def create
	    @remit_info = @payee.remit_infos.new(remit_info_params)
	    @remit_info.save
	        redirect_to @payee, notice: "Your remit_info was successfully posted."
	end

	private

	    def remit_info_params
	        params.require(:remit_info).permit(:bank_name, :bank_code, :branch_bank_code, :account_number)
	    end
end
