class RateFilter
    class << self
        def retrive_all
			Rate.all
        end
		def find_by_id(id)
			Rate.find(id)
		end
    end
end
  