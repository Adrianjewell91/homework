class Toy < ApplicationRecord
  validates :name, uniqueness: { scope: [:toyable] } #I thought it could go the other way too.
  belongs_to :toyable, polymorphic: true


end
