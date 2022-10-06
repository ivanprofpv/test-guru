class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage
    @current_test = test_passage.test
    @current_user = test_passage.user
    @badges = Badge.all
  end

  def call
    @count_user_badges = @current_user.badges.count
    @badges.each do |badge|
      if already_received?(badge) && send("#{badge.rule}_rule_completed?", badge)
        @current_user.badges << badge
      end
    end

    if @count_user_badges != @current_user.badges.count
    end
  end

  private

  def already_received?(badge)
    @current_user.badges.exclude?(badge)
  end

  def first_rule_completed?(badge)
    completed = @current_user.test_passages
                  .where(test: @current_test, passed: true)
                  .pluck(:test_id).uniq
    first_test = TestPassage.where(user: @current_user, test: @current_test)
    first_test.count == 1 && completed.count == 1
  end

  def level_rule_completed?(rule_value)
    all_tests_by_level = Test.tests_per_level(rule_value).count
    passed_tests_by_level = tests_passed_success.tests_per_level(rule_value).uniq.count
    all_tests_by_level == passed_tests_by_level
  end

  def category_rule_completed?(rule_value)
    all_tests_by_category = Test.search_tests_category(rule_value).count
    passed_tests_by_category = tests_passed_success.search_tests_category(rule_value).uniq.count
    all_tests_by_category == passed_tests_by_category
  end

  def tests_passed_success
    @current_user.tests.where(test_passages: passed = true)
  end

end
