class Employee < ApplicationRecord
	#多對多關聯，申請人/記錄人
	has_many :requisition_employees, source: :employee
	has_many :purchase_requisitions, :through => :requisition_employees
	# 多型關聯，payee可能是employee或company
	#has_many :requisition_employees_as_payee, class_name: 'RequisitionEmployee', as: :payee
	has_many :remit_infos, :as => :payee
end
