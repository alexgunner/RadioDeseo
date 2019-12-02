class PostCategory < ApplicationRecord
  belongs_to :post
  belongs_to :category

  def self.register post, category
  	post_category = PostCategory.new
  	post_category.post = post
  	category_found = Category.find(category).first
  	post_category.category = category_found
  	post_category.save!
  end
end
