class House < ApplicationRecord  
  validates :address, presence: true

  has_many :residents,
    primary_key: :id, #options hash
    foreign_key: :house_id,
    class_name: :Person
end
