class DeletePeopleAndCreateCharacter < ActiveRecord::Migration[5.1]
  def change
  	drop_table :people
  	#之前的foreign key
  	remove_column :companies, :employee_id
  	remove_column :employees, :company_id
  	add_column :purchase_requisitions, :payee_type, :integer #受款類型: 員工/廠商
  	add_column :purchase_requisitions, :company_id, :integer #受款人：可為null

  	create_table :requisition_employee do |t|
    	t.integer :purchase_requisition_id #請購單號碼
    	t.integer :employee_id #員工的資料
    	t.integer :employee_type #員工的角色
    	t.timestamps
    end
  end
end
