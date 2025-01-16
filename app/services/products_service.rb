class ProductsService
    class << self
      def save(product)
        ActiveRecord::Base.transaction do
          if product.save
            return true
          else
            raise ActiveRecord::Rollback
          end
        end
      end
  
      def update(product, product_params)
        if product.update(product_params)
          return true
        else
          return false
        end
      end
  
      def destroy(product)
        if product.destroy
          return true
        else
          return false
        end
      end
    end
  end
  