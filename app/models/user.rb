class User < ActiveRecord::Base
    has_many :reviews
    has_many :products,through: :reviews

    def favorite_product
      self.reviews.order("star_rating DESC").first.product
    end

    def remove_reviews(product)
      # product.reviews.select do |review|
      #   review[:user_id] == self[:id]
          # review.destroy
        
      # end
      self.reviews.where(product: product).destroy_all
    end
end