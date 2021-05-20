class Blog < ApplicationRecord
  belongs_to :user
  has_many :contents
end
