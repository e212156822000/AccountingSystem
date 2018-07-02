class CreateRemitInfosAndModifyPurchaseRequisitions < ActiveRecord::Migration[5.1]
  def change
    create_table :remit_infos do |t|
    	t.string  :bank_name #帳戶名稱
    	t.integer :bank_code #銀行代碼
    	t.integer :branch_bank_code #分行代碼
    	t.integer :account_number #帳號
    	t.integer :payee_type_code
    	t.integer :payee_id
    end

    remove_column :purchase_requisitions, :payee_type #刪除匯款資訊
    remove_column :purchase_requisitions, :company_id #刪除匯款資訊
  	add_column :purchase_requisitions, :remit_info_id, :integer #新增匯款資訊外鍵

  end
end
