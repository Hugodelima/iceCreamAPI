class SaleProductFilter
    class << self

      def retrieve_all
        sale_product = SaleProduct.all  
      end

      private
  
      def filter_by_sale(sale_products, sale_id)
        sale_products.where(sale_id: sale_id)
      end
  
      def filter_by_product(sale_products, product_id)
        sale_products.where(product_id: product_id)
      end
    end
  end
  