class RenamePurchaseRequisitionEmployee < ActiveRecord::Migration[5.1]
  def change
  	rename_table :requisition_employee, :requisition_employees
  end
end
