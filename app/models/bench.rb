class Bench < ApplicationRecord
  belongs_to :user
  
  validates :bench_record, presence: true, length: { maximum: 6 }
end
