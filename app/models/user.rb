class User < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates_uniqueness_of :username
    has_many :cafes
end