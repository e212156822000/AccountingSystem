class RequisitionEmployee < ApplicationRecord
	belongs_to :employees
	belongs_to :purchase_requisitions

	accepts_nested_attributes_for :employees
end
