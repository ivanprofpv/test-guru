class Test < ApplicationRecord

  class << self
    def search_tests_category(category)
      Test.joins("INNER JOIN categories ON tests.category_id = categories.id")
          .where(categories: { title: category })
          .order(title: :desc)
          .pluck(:title)
    end
  end
