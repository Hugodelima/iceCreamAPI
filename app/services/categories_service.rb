class CategoriesService
  class << self

    def save (category)
      category.save
    end

    def update(category, category_params)
      category.update(category_params) ? true : false
    end

    def destroy(category)
      category.destroy
    end
  end
end