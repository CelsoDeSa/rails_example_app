class Post < ApplicationRecord
    has_many :books, dependent: :destroy
    # accepts_nested_attributes_for :books, allow_destroy: true

    def to_param
        slug
    end
end
