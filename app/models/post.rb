class Post < ApplicationRecord
    has_many :books, dependent: :destroy
end
