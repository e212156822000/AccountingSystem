class Company < ApplicationRecord
	has_many :purchase_requisitions
	has_many :remit_infos , :as => :payee

	validates_uniqueness_of :name
	validates_presence_of :name
end
