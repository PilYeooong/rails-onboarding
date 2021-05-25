class InvestedAsset < ApplicationRecord
  belongs_to :diary
  belongs_to :user
  has_one :asset
end
