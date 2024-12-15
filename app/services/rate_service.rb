class RateService
    class << self

      def save(rate)
        rate.save
      end
  
      def update(rate, rate_params)
        rate.update(rate_params) ? true : false
      end
  
      def destroy(rate)
        rate.destroy
      end
    end
  end
  