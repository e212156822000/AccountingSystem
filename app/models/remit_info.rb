class RemitInfo < ApplicationRecord
	belongs_to :payee, :polymorphic => true
	has_many :purchase_requisitions
end
