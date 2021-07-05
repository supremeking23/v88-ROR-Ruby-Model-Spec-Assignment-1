class User < ApplicationRecord
    email_format = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, :presence => true
    validates :email, uniqueness: true
    validates :email, format: {with: email_format}
end
