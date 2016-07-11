class Fileupload < ActiveRecord::Base
  belongs_to :language
	extend FriendlyId
	friendly_id :title, use: :slugged



	mount_uploader :source, CodeUploader
	mount_uploader :bin, CodeUploader


end
