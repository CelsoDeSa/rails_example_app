class Book < ApplicationRecord
  belongs_to :post
  validates :title, :rating, :author, :isbn, :image, :buy_option_amazon, :post_id, presence: true
  before_save :modify_image, :set_slug
  validates :slug, uniqueness: true

  def to_param
    slug
  end

  protected
 
  def modify_image
    self.image.gsub!(/("_blank")/, "\"_blank\" rel=\"nofollow\"")
    self.image.gsub!(/(img border)/, "img width=\"180px\" border")
  end

  def set_slug
    if self.slug.empty?
      self.slug = I18n.transliterate(self.title)
      self.slug.downcase!.gsub!(/\d+\s|\s\d+|\s\W.+/, "").gsub!(" ", "-")
      self.slug += "-" + I18n.transliterate(self.author).downcase.gsub(" ", "-")
    end
  end
end