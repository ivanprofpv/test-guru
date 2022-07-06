class User < ApplicationRecord

  def user_tests_passed(level)
    tests.where(level:)
  end

end
