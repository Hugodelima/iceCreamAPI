class ProductsFilter

    class << self

      def retrive_all
        Product.all
      end
  
      def filter_by_category(products, category_id)
        products.where(category_id: category_id)
      end
      
  
      def filter_by_title(products, title)
        products.where("title LIKE ?", "%#{title}%")
      end
    end
  end
  