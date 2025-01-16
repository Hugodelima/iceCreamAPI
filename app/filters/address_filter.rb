class AddressFilter
    class << self
      def retrive_all
        Address.all
      end
  
      def find_by_id(id)
        Address.find(id)
      end
  
      def find_by_city(city)
        Address.where(city: city)
      end
  
      def find_by_neighborhood(neighborhood)
        Address.where(neighborhood: neighborhood)
      end
  
      def find_by_zip_code(zip_code)
        Address.where(zip_code: zip_code)
      end
    end
  end
  