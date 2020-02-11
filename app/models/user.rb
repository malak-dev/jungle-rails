class User < ActiveRecord::Base

  has_secure_password
   class << self
      def authenticate_with_credentials email,password
        if user = User.find_by_email(email.downcase)
            user.authenticate(password)
        end
      end 
    end

end
