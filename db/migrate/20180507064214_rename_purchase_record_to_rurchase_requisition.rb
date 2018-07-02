class RenamePurchaseRecordToRurchaseRequisition < ActiveRecord::Migration[5.1]
  def change
  	rename_table :purchase_records, :purchase_requisitions
  end
end
