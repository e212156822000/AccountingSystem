class Attachment < ApplicationRecord
	# def uploaded_file=(incoming_file)
	#    self.filename = incoming_file.original_filename
	#    self.content_type = incoming_file.content_type
	#    self.data = incoming_file.read
	# end

	# def filename=(new_filename)
	#   write_attribute("filename", sanitize_filename(new_filename))
	# end

	# private
	# 	def sanitize_filename(filename)
	#     	#get only the filename, not the whole path (from IE)
	#     	just_filename = File.basename(filename)
	#     	#replace all non-alphanumeric, underscore or periods with underscores
	#     	just_filename.gsub(/[^\w\.\-]/, '_')
	#   	end
	belongs_to :purchase_requisitions
	# paperClip函式會爆掉
	# has_attached_file :attachments,
	# 	:path => ":rails_root/public/purchase_requisitions_files/:id/:filename",
	# 	:url  => "/purchase_requisitions_files/:id/:filename"
	# do_not_validate_attachment_file_type :attachment
end
