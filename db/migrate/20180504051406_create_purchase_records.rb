class CreatePurchaseRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :purchase_records do |t|
    	t.string  :name # 品名與規格
    	t.string  :description #用途與說明
    	t.string  :unit # 單位
    	t.float   :unit_price # 單價
    	t.float   :amount #數量
    	t.float   :total_price #金額
    	t.string  :purchase_requisition_files #請購單掃描檔案 
    	t.date    :payment_due_date #付款期限
    	t.integer :payment_term #付款方式
    	t.integer :payment_condition #運稅條件
    	t.integer :process_status #處理進度
      	t.timestamps
    end
  end
end
