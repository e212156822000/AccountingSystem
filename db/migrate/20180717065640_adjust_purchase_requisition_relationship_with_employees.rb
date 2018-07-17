class AdjustPurchaseRequisitionRelationshipWithEmployees < ActiveRecord::Migration[5.1]
  def change
  	#忘記自己已經調整過資料庫了
  	#懶的刪掉這個多的migration檔案，所以就刪掉再新增一次
  	remove_column :purchase_requisitions, :recorder_id 
  	add_column :purchase_requisitions, :recorder_id, :integer #新增recorder外鍵
  end
end
