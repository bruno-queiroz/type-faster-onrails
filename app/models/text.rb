class Text < ApplicationRecord
    validates :author, presence: true
    validates :text, presence: true
    validates :title, presence: true
    validates :image, presence: true
end
