class ChangeBackDoSomethingInPurchaseRequisitions < ActiveRecord::Migration[5.1]
  def change
  	 # 請購單status code改回integer狀態
  	remove_column :purchase_requisitions, :payment_term
  	remove_column :purchase_requisitions, :payment_condition
  	add_column :purchase_requisitions, :payment_term, :integer
  	add_column :purchase_requisitions, :payment_condition, :integer
  end
end
