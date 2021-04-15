class Note < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: { maximum: 30, minimum: 1}
    validates :description, length: { maximum: 1000 }
end
