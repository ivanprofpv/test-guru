class Answer < ApplicationRecord

  belongs_to :question

  COUNT_ANSWERS_FOR_QUESTIONS = 4

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validation_of_questions_1_4, on: :create

  def validation_of_questions_1_4
    if question.answers.size >= COUNT_ANSWERS_FOR_QUESTIONS
      errors.add(:answers, message:
        "У одного Вопроса может быть от 1-го до 4-х ответов.")
    end
  end

end
