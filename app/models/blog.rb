class Blog < ApplicationRecord
  belongs_to :user
  has_many :contents

  scope :published, -> { where(status: 'published').order("id desc") }
  scope :drafts, -> { where.not(status: 'published').order("id desc") }
end
