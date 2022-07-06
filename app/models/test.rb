class Test < ApplicationRecord

  class << self
    def search_tests_category(category)
      joins(:category).where(categories: {title: category})
                      .order(title: :desc).pluck(:title)
    end
  end

end
