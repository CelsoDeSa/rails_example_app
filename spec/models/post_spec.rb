require "rails_helper"

RSpec.describe Post, type: :model do
    context "before saving" do
        it "sets post's slug based on the title" do
            post = Post.create(title: "Something Liké this (2019)", slug: "")
            test_slug = "something-like-this"

            expect(post.slug).to eq(test_slug)
        end
    end
end