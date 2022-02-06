require 'minitest/autorun'
require './models/memo'

class Memo
  private

  def self.save_json
    # Nothing to do
  end
end

class MemoTest < Minitest::Test
  def test_initialize
    memo = Memo.new(1, 'title', 'content')

    assert_equal 1, memo.id
    assert_equal 'title', memo.title
    assert_equal 'content', memo.content
  end

  def test_create
    params = {title: 'title', content: 'content'}
    memo = Memo.create(params)

    assert_equal 'title', memo.title
    assert_equal 'content', memo.content
  end
end