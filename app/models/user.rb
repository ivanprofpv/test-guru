class User < ApplicationRecord

  def tests_passeds(level)
    Test.joins("INNER JOIN tests_passeds ON tests_passeds.id_tests = tests.id")
        .where(level: level, tests_passeds: { user_id: 1 })
  end

end
