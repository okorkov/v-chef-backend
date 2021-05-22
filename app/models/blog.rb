class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :contents
  has_one_attached :image

  scope :published, -> { where(status: 'published').order("id desc") }
  scope :drafts, -> { where.not(status: 'published').order("id desc") }
  scope :cooking, -> { where(status: 'published', category_id: 2).order("id desc") }
  scope :lifestyle, -> { where(status: 'published', category_id: 1).order("id desc") }

end
