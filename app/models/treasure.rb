class Treasure < ActiveRecord::Base
  validates :title, presence: true
end
