class AddColumnsToPurchaseRecords < ActiveRecord::Migration[5.1]
  def change
  	# 申請人＆記錄人資訊
    add_column :employees, :employee_id , :integer
    add_index :employees, :employee_id
    # 廠商的名字與其匯款資訊
    add_column :companies, :company_id , :integer
    add_index :companies, :company_id
  end
end
