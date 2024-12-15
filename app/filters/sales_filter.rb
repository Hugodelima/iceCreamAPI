class SalesFilter

    class << self

      def retrieve_all
        sales = Sale.all
      end
  
      def find_by_id(id)
        Sale.find_by(id: id)
      end
  
      private
  
      def filter_by_user_id(sales, user_id)
        sales.where(user_id: user_id)
      end
  
      def filter_by_amount(sales, amount)
        sales.where(amount: amount)
      end
    end
  end
  