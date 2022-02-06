require 'minitest/autorun'
require './models/memo'

class MemoTest < Minitest::Test
  def test_initialize
    memo = Memo.new(1, 'title', 'content')

    assert_equal 1, memo.id
    assert_equal 'title', memo.title
    assert_equal 'content', memo.content
  end
end