class Organization < ApplicationRecord
  has_many :user, dependent: :destroy
end
