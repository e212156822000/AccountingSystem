class AuthController < ApplicationController
	include AuthHelper

	def gettoken
    	token = get_token_from_code params[:code]
    	session[:azure_token] = params.merge(:access_token => token.token, :refresh_token => token.refresh_token, :expires_at => token.expires_at)
    	respond_to do |format|
      		format.html { redirect_to mail_purchase_requisitions_path }
      		format.json { }
      	end
	end
end
