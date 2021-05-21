class Blog < ApplicationRecord
  belongs_to :user
  has_many :contents
  has_one_attached :image

  scope :published, -> { where(status: 'published').order("id desc") }
  scope :drafts, -> { where.not(status: 'published').order("id desc") }
end
