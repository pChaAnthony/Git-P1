class User < ActiveRecord::Base
	validates :user, presence: true, uniqueness: true
	has_secure_password
	
	after_destroy :ensure_an_admin_remains
	
	private
		def ensure_an_admin_remains
			if User.count.zero?
				raise "Can't delete, this is the last user"
			end
		end
end
