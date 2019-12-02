class PostLabel < ApplicationRecord
  belongs_to :post
  belongs_to :label

  def self.register post, label
  	post_label = PostLabel.new
  	post_label.post = post
  	label_found = Label.find(label).first
  	post_label.label = label_found
  	post_label.save!
  end
end
