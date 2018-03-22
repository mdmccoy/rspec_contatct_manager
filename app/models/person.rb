class Person < ApplicationRecord
  validates :last_name, presence: true
end
