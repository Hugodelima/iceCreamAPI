class SaleProductService
    class << self
      
      def save(sale_product)
        sale_product.save
      end
  
      def update(sale_product, params)
        sale_product.update(params)
      end
  
      def destroy(sale_product)
        sale_product.destroy
      end
    end
end
  