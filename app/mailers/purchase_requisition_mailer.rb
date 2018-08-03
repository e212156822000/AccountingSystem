class PurchaseRequisitionMailer < ApplicationMailer
	default :from => "Polaris2@PolarisPhotonics.onmicrosoft.com"
  	def new_purchase_inform(purchase_requisition)
  		@purchase_requisition = purchase_requisition
    	# attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    	mail(:to => "qooe212156822000@gmail.com", :subject => "新的請購單 #{purchase_requisition.id} 建立了！")
  	end
end
