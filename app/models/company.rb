class Company < ApplicationRecord
  include Contact

  validates :name, presence: true

  def to_s
    "#{self.name}"
  end
end
