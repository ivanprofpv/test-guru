class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :tests_passeds, dependent: nil
  has_many :users, through: :tests_passeds

    def self.search_tests_category(category)
      joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
    end

end
