class Book < ApplicationRecord
  belongs_to :post
  before_save :add_nofollow

  protected
 
  def add_nofollow
    self.image.gsub!(/("_blank")/, "\"_blank\" rel=\"nofollow\"")
  end

end
