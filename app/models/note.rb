class Note < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { maximum: 30 }
    validates :description, length: { maximum: 1000 }
end
