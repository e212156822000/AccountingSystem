class ChangeColumnNameOfRemitInfos < ActiveRecord::Migration[5.1]
  def change
    remove_column :remit_infos, :payee_type_code #刪除匯款資訊
  	add_column :remit_infos, :payee_type, :string #新增匯款資訊外鍵
  end
end
