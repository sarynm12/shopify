class Photo < ApplicationRecord
  validates_presence_of :source
  validates_presence_of :title
  validates_presence_of :description
  belongs_to :user
end
