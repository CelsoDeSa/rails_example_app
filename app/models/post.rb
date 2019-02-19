class Post < ApplicationRecord
    has_many :books, dependent: :destroy
    validates :title, presence: true
    before_save :set_slug
    validates :slug, uniqueness: true
    # accepts_nested_attributes_for :books, allow_destroy: true

    def to_param
        slug
    end

    protected

    def set_slug
        #Before saving get the title, save to a slug and modify it properly for SEO
        self.slug = self.title
        self.slug.downcase!.gsub!(/\d+\s|\s\d+|\s\W\w+\W/, "").gsub!(" ", "-")
    end
end
