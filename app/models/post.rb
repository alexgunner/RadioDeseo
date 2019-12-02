class Post < ApplicationRecord
	has_many :post_categories
	has_many :post_labels

	def categories
		categories = []
		post_categories.each do |category|
			categories.push Category.find(category.category_id)
		end
		categories
	end

	def labels
		labels = []
		post_labels.each do |label|
			labels.push Label.find(label.label_id)
		end
		labels
	end

	def has_category category_id
		result = true
		if post_categories.find_by(category_id: category_id).nil?
			result = false
		end
		result
	end

	def has_label label_id
		result = true
		if post_labels.find_by(label_id: label_id).nil?
			result = false
		end
		result
	end
end
