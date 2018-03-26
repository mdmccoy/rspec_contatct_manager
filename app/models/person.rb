class Person < ApplicationRecord
  include Contact

  validates :first_name,:last_name, presence: true

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def to_s
    "#{self.last_name}, #{self.first_name}"
  end
end
