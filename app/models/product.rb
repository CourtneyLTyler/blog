class Product < ApplicationRecord
  has_many :orders
  has_many :comments
  validates :name, presence: true

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def self.search(search_term)
    if(Rails.env.production?)
      #Using ilike for case insensitivity on postgres
      Product.where("name ilike ?", "%#{search_term}%")
    else
      Product.where("name LIKE ?", "%#{search_term}%")
    end
  end
end
