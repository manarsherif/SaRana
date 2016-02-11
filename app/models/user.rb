class User < ActiveRecord::Base
 has_secure_password
 has_many :comments
   acts_as_voter
  validates :username,
           presence: true,
           uniqueness: true
end