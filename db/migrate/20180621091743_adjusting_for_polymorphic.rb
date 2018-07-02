class AdjustingForPolymorphic < ActiveRecord::Migration[5.1]
  def change
  	#employees的調整
  	remove_column :employees, :bank_name
  	remove_column :employees, :bank_code
  	remove_column :employees, :branch_bank_code
  	remove_column :employees, :account_number
  	#companies調整
  	remove_column :companies, :bank_name
  	remove_column :companies, :bank_code
  	remove_column :companies, :branch_bank_code
  	remove_column :companies, :account_number
  	#remit_info已經有payee_id和payee_type了
  end
end
