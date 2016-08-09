class Fileupload < ActiveRecord::Base

	belongs_to :language

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_attached_file :code,
										:storage => :google_drive,
										:google_drive_credentials => "#{Rails.root}/config/google_drive.yml",
										:google_drive_options => {
												:public_folder_id => '0B5D6lx1xpqw2eG96Ylc2aklGeVE'
										}

	scope  :by_language, ->(sort){ where :language_id => sort }

end

