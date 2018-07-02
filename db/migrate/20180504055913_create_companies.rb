class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
    	t.string  :name #廠商名稱
    	t.string  :description #廠商描述
    	t.string  :bank_name #帳戶名稱
    	t.integer :bank_code #銀行代碼
    	t.integer :branch_bank_code #分行代碼
    	t.integer :account_number #帳號
    	t.timestamps
    end
  end
end
