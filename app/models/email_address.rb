class EmailAddress < ApplicationRecord
  belongs_to :contact, polymorphic: true

  validates :address,:contact_id, presence: true
end
