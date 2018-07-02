class PurchaseRequisition < ApplicationRecord
	#has_many :requisition_employees
	#has_many :employees, :through => :requisition_employees
	belongs_to :recorder, :class_name => "Employee", foreign_key: "recorder_id"
	belongs_to :payee , :optional => true, :polymorphic => true

	accepts_nested_attributes_for :employees
	accepts_nested_attributes_for :requisition_employees
end
