class User < ApplicationRecord

  has_many :tests_passages, dependent: nil
  has_many :tests, through: :tests_passages
  has_many :created_tests, class_name: 'Test',
  foreign_key: :author_id, dependent: :destroy

  has_secure_password

  def tests_passage(test)
    tests_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
