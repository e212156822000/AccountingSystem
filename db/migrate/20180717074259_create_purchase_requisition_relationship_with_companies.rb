class CreatePurchaseRequisitionRelationshipWithCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :purchase_requisitions, :company_id, :integer #新增company外鍵
  end
end
