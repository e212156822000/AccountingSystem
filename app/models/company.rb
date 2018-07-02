class Company < ApplicationRecord
	has_many :purchase_requisitions , :through => :remit_info
	has_many :remit_infos , :as => :payee
end
