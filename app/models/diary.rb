class Diary < ApplicationRecord
  validates :title, presence: true
  validates :contents, presence: true
  belongs_to :user
  has_many :invested_assets, :dependent => :delete_all
end
