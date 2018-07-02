class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
    	t.string  :name #姓名
    	t.string  :job_title #職稱
    	t.string  :bank_name #帳戶名稱
    	t.integer :bank_code #銀行代碼
    	t.integer :branch_bank_code #分行代碼
    	t.integer :account_number #帳號
    	t.string  :username #帳號
    	t.string  :password #密碼
    	t.timestamps
    end
  end
end
