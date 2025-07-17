class User < ApplicationRecord
  has_many :plans
  has_many :plan_members
  has_many :joined_plans, through: :plan_members, source: :plan
  has_many :chat_messages
  has_many :notes
  has_many :memories
  has_many :memory_folders
  has_many :schedule_items
end
