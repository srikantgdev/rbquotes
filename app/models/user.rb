class User < ApplicationRecord
  self.table_name = "users"
  validates :username, presence: true, uniqueness: true
  has_many :quotes
end
