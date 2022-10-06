class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :level_easy, -> { where(level: 0..1) }
  scope :level_medium, -> { where(level: 2..4) }
  scope :level_hard, -> { where(level: 5..Float::INFINITY) }
  scope :search_tests_category, ->(category) {
    joins(:category).where(categories: { title: category }) }
  scope :activated, -> { where(activated: true) }

  validates :title, presence: true
  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :timer, presence: true, numericality: { only_integer: true, greater_than: 0 }


end
