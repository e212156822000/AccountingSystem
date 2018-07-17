class Employee < ApplicationRecord
	#多對多關聯，申請人/記錄人
	# has_many :requisition_employees, autosave: true
	# has_many :purchase_requisitions, :through => :requisition_employees, autosave: true #, :inverse_of => :employee
	# recorder 一定是employee
	has_many :purchase_requisitions, :as => :recorder
	# 多型關聯，payee可能是employee或company
	has_many :remit_infos, :as => :payee
end
