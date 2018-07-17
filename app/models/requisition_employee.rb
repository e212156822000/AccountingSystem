class RequisitionEmployee < ApplicationRecord
	validates_presence_of :employees, :purchase_requisitions
	belongs_to :employees , :inverse_of => :requisition_employees
	belongs_to :purchase_requisitions, :inverse_of => :requisition_employees

	accepts_nested_attributes_for :employees
end
