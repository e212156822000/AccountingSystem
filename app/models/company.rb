class Company < ApplicationRecord
	has_many :purchase_requisitions
	has_many :remit_infos , :as => :payee
end
