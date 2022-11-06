class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users,through: :reviews

    def leave_review(user,star_rating:,comment:)
      Review.create(comment:comment,star_rating:star_rating,user:user,product:self)
    end

    def print_all_reviews
      self.reviews.map do |review|
        "#{review.product.name} by #{review.user.name}:#{review.star_rating} #{review.comment}"
      end
    end

    def average_rating
      self.reviews.average("star_rating").to_f
    end
end