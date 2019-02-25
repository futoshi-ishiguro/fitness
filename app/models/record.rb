class Record < ApplicationRecord
  belongs_to :user
  
  validates :status, presence: true
  validates :record, presence: true, length: { maximum: 6 }
end
