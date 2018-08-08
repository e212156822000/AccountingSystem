class CreateTableAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
    	t.string  :filename #檔案名稱
    	t.string  :content_type #檔案類型
    	t.binary  :data
    end
  end
end
