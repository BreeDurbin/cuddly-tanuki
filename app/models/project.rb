class Project < ActiveRecord::Base
	extend FriendlyId
	friendly_id :title, use: :slugged

	mount_uploader :source, CodeUploader
	mount_uploader :bin, CodeUploader
end
