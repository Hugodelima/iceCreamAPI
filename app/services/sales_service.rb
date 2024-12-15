class SalesService
    class << self

        def save (sale)
            sale.save
        end

        def update(sale, sale_params)
            sale.update(sale_params) ? true : false
        end
  
        def destroy(sale)
            if sale.destroy
            return true
            else
            return false
            end
        end
    end
  end
  