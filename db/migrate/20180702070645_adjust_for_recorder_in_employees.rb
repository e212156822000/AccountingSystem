class AdjustForRecorderInEmployees < ActiveRecord::Migration[5.1]
  def change
  	add_column :purchase_requisitions, :recorder_id, :integer #新增recorder外鍵
  end
end
