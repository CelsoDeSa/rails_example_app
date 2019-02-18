class Book < ApplicationRecord
  belongs_to :post
  validates :title, :isbn, :image, :buy_option_amazon, :post_id, presence: true
  before_save :modify_image, :set_slug

  protected
 
  def modify_image
    self.image.gsub!(/("_blank")/, "\"_blank\" rel=\"nofollow\"")
    self.image.gsub!(/(img border)/, "img width=\"180px\" border")
  end

  def set_slug
    self.slug = self.title
    self.slug.downcase!.gsub!(/\d+\s|\s\d+|\s\W.+/, "").gsub!(" ", "-")
    self.slug += "-isbn-#{self.isbn}"
  end
end