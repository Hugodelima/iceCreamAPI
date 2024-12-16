class UserRateProductService
    class << self
      def save(user_rate_product)
        user_rate_product.save
      end
  
      def update(user_rate_product, params)
        user_rate_product.update(params)
      end
  
      def destroy(user_rate_product)
        user_rate_product.destroy
      end
    end
  end
  