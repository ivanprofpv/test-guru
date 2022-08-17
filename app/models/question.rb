class Question < ApplicationRecord

  has_many :answers, dependent: :destroy
  has_many :gists
  belongs_to :test

  validates :title, presence: true

  

end
