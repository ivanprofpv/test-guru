class User < ApplicationRecord

  has_many :tests_passeds, dependent: nil
  has_many :tests, through: :tests_passeds
  has_many :created_tests, class_name: 'Test',
  foreign_key: :author_id, dependent: :destroy

  #перенес в test.rb в виде scope
  # def tests_passeds(level)
  #   tests.where(level: level)
  # end

  validates :email, presence: true

end
