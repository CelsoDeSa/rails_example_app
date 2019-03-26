require "rails_helper"

RSpec.describe Book, type: :model do
    post = Post.create!(title:"Post title", slug: "post-slug")
    book = post.books.create!(title: "Something Liké this (2019)", slug: "", author: "Test Author", isbn: "0123456789000", image: "<a href='https://www.amazon.com.br/Direito-Constitucional-Esquematizado-Pedro-Lenza/dp/8547229477/ref=as_li_ss_il?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&amp;crid=2M70EGCBWCQJU&amp;keywords=direito+constitucional&amp;qid=1550510718&amp;s=gateway&amp;sprefix=direito+consti,aps,291&amp;sr=8-1&amp;linkCode=li3&amp;tag=direitocerto-20&amp;linkId=5301da3b1cf9938ba56ef8ab25d20ad7&amp;language=pt_BR' target='_blank'><img border='0' src='//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&amp;ASIN=8547229477&amp;Format=_SL250_&amp;ID=AsinImage&amp;MarketPlace=BR&amp;ServiceVersion=20070822&amp;WS=1&amp;tag=direitocerto-20&amp;language=pt_BR'></a>", buy_option_amazon: "link", rating: 5)

    context "before saving" do
        it "modify image to have the nofollow tag and the right width" do
            test_img = "<a href='https://www.amazon.com.br/Direito-Constitucional-Esquematizado-Pedro-Lenza/dp/8547229477/ref=as_li_ss_il?__mk_pt_BR=%C3%85M%C3%85%C5%BD%C3%95%C3%91&amp;crid=2M70EGCBWCQJU&amp;keywords=direito+constitucional&amp;qid=1550510718&amp;s=gateway&amp;sprefix=direito+consti,aps,291&amp;sr=8-1&amp;linkCode=li3&amp;tag=direitocerto-20&amp;linkId=5301da3b1cf9938ba56ef8ab25d20ad7&amp;language=pt_BR' target='_blank' rel='nofollow'><img width='180px' border='0' src='//ws-na.amazon-adsystem.com/widgets/q?_encoding=UTF8&amp;ASIN=8547229477&amp;Format=_SL250_&amp;ID=AsinImage&amp;MarketPlace=BR&amp;ServiceVersion=20070822&amp;WS=1&amp;tag=direitocerto-20&amp;language=pt_BR'></a>"
        end

        it "sets book's slug based on the title" do
            test_slug = "something-like-this-test-author"

            expect(book.slug).to eq(test_slug)
        end
    end
end
