class AddDepositPriceToPurchaseRequisition < ActiveRecord::Migration[5.1]
  def change
  	add_column :purchase_requisitions, :deposit_price, :float
  end
end
