class CategoryFilter
	class << self
        def retrive_all
			Category.all
        end
		
		def find_by_id(id)
			Category.find(id)
		end
	end
end
