class PurchaseRequisition < ApplicationRecord
	belongs_to :recorder, :optional => true, foreign_key: "recorder_id"
	belongs_to :payee , :optional => true, :polymorphic => true
	belongs_to :company , :optional => true
	has_many_attached :attachments , :dependent => :destory
	# accepts_nested_attributes_for :employees
	# accepts_nested_attributes_for :requisition_employees

end
