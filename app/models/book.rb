class Book < ApplicationRecord
  belongs_to :post
  validates :title, :isbn, :image, :buy_option_amazon, :post_id, presence: true
  before_save :add_nofollow_to_image_link, :set_slug

  protected
 
  def add_nofollow_to_image_link
    self.image.gsub!(/("_blank")/, "\"_blank\" rel=\"nofollow\"")
  end

  def set_slug
    self.slug = self.title
    self.slug.downcase!.gsub!(/\d+\s|\s\d+|\s\W\w+\W/, "").gsub!(" ", "-")
    self.slug += "-isbn-#{self.isbn}"
  end
end