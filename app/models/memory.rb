class Memory < ApplicationRecord
  belongs_to :memoryfolder
  belongs_to :user
end
