class CreateForeignKeyToCompaniesAndEmployees < ActiveRecord::Migration[5.1]
  def change
    # 申請人＆記錄人資訊
    add_column :companies, :employee_id , :integer
    remove_column :companies , :company_id
    # 廠商的名字與其匯款資訊
    add_column :employees, :company_id , :integer
    remove_column :employees , :employee_id
  end
end
