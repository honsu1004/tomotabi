class MemoryFolder < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :memories
end
