class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_many :tests_passages, dependent: nil
  has_many :tests, through: :tests_passages
  has_many :created_tests, class_name: 'Test',
  foreign_key: :author_id, dependent: :destroy

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: VALID_EMAIL_REGEX }

  def tests_passage(test)
    tests_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
