class Category < ApplicationRecord

  has_many :tests, dependent: :nullify

  default_scope { order(title: :desc) }

  validates :title, presence: true

end
