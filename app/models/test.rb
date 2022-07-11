class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :tests_passeds, dependent: nil
  has_many :users, through: :tests_passeds

  scope :level_easy -> { where(level: 0..1) }
  scope :level_medium -> { where(level: 2..4) }
  scope :level_hard -> { where(level: 5..Float::INFINITY) }

  scope :search_tests_category, ->(category) {
                       joins(:category)
                      .where(categories: { title: category })
                      .order(title: :desc)
                      .pluck(:title) }

    # def self.search_tests_category(category)
    #   joins(:category)
    #   .where(categories: { title: category })
    #   .order(title: :desc)
    #   .pluck(:title)
    # end

  scope :tests_passeds, ->(level) { where(level: level) }

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :level, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }


end
