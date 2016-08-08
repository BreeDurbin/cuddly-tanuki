class Fileupload < ActiveRecord::Base

	belongs_to :language

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_attached_file :code,
										default_url: "/images/:style/missing.png",
										:storage => :google_drive,
										:google_drive_credentials => "#{Rails.root}/config/google_drive.yml"

	scope  :by_language, ->(sort){ where :language_id => sort }

end