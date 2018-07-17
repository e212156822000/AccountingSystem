class PurchaseRequisition < ApplicationRecord
	# has_many :requisition_employees, autosave: true#, :inverse_of => :purchase_requisition
	# has_many :employees, :through => :requisition_employees, autosave: true, class_name: "::Employee" #, :inverse_of => :purchase_requisition
	belongs_to :recorder, :optional => true, foreign_key: "recorder_id"
	belongs_to :payee , :optional => true, :polymorphic => true
	belongs_to :company , :optional => true
	# accepts_nested_attributes_for :employees
	# accepts_nested_attributes_for :requisition_employees

end
