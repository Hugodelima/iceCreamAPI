class UserRateProductFilter
    class << self
        
      def retrieve_all
        userRateProduct = UserRateProduct.all
      end
  
      private
  
      def filter_by_user(user_rate_products, user_id)
        user_rate_products.where(user_id: user_id)
      end
  
      def filter_by_product(user_rate_products, product_id)
        user_rate_products.where(product_id: product_id)
      end
  
      def filter_by_rate(user_rate_products, rate_id)
        user_rate_products.where(rate_id: rate_id)
      end
    end
  end
  