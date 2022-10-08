class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_question, only: %i[create update]
  before_update :before_update_set_success

  SUCCESS_RATE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def success_rate?
    percentage_correct_answers >= SUCCESS_RATE
  end

  def percentage_correct_answers
    correct_questions.to_f / test.questions.count * 100
  end

  def question_number
    self.test.questions.where('id <= ?', current_question.id).count
  end

  def time_left?
    Time.now - (self.created_at + self.test.timer * 60) >= 0
  end

  def get_timer
    (self.created_at + self.test.timer * 60) - Time.now
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_validation_set_question
    self.current_question = if current_question.nil?
                              test.questions.first
                            else
                              test.questions.order(:id).where('id > ?', current_question.id).first
                            end
  end

  def before_update_set_success
    self.passed = true if self.success_rate?
  end
end
