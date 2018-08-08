class UpdateColumnsInPurchaseRequisitions < ActiveRecord::Migration[5.1]
  def change
  	# 請購單status code直接改儲存value
  	change_column :purchase_requisitions, :payment_term, :string
  	change_column :purchase_requisitions, :payment_condition, :string
  	# 匯款資訊，007顯示不出來
  	change_column :remit_infos, :bank_code, :string
  	change_column :remit_infos, :branch_bank_code, :string
  	change_column :remit_infos, :account_number, :string
  	# employee需要mail資訊
  	add_column :employees, :email, :string
  end
end
