require 'test_helper'

class SuggestionTest < ActiveSupport::TestCase
  def setup
    @user = users(:andrew)
    @suggestion = @user.suggestion.build content: 'test content', user_id: @user.id
  end

  test 'should be valid' do
    @suggestion.valid?
  end

  test 'user_id should be present' do
    @suggestion.user_id = nil
    assert_not @suggestion.valid?
  end

  test 'content should be present' do
    @suggestion.content = '     '
    assert_not @suggestion.valid?
  end

  test 'order should be most recent first' do
    assert_equal suggestions(:most_recent), Suggestion.first
  end
end
