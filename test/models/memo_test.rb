# frozen_string_literal: true

require 'minitest/autorun'
require './models/memo'

class Memo
  # Don't update memo.json for test
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
    params = { title: 'title', content: 'content' }
    memo = Memo.create(params)

    assert_equal 'title', memo.title
    assert_equal 'content', memo.content
  end

  def test_update
    memo = Memo.new(1, 'title1', 'content1')
    params = { id: 1, title: 'title', content: 'content' }
    actual = memo.update(params)

    assert_equal 'title', actual.title
    assert_equal 'content', actual.content
  end

  def test_update_nil
    memo = Memo.new(4, 'title1', 'content1')
    params = { id: 4, title: 'title', content: 'content' }
    actual = memo.update(params)

    assert_nil actual
  end

  def test_all
    memos = Memo.all
    expected = [Memo.new(1, 'title1', 'content1'),
                Memo.new(2, 'title2', 'content2'),
                Memo.new(3, 'title3', 'content3')]

    assert_equal expected.size, memos.size
    memos.each_with_index do |memo, index|
      assert_equal expected[index].id, memo.id
      assert_equal expected[index].title, memo.title
      assert_equal expected[index].content, memo.content
    end
  end

  def test_find
    memo = Memo.find(1)
    expected = Memo.new(1, 'title1', 'content1')

    assert_equal expected.id, memo.id
    assert_equal expected.title, memo.title
    assert_equal expected.content, memo.content
  end

  def test_find_not_found
    memo = Memo.find(4)

    assert_nil memo
  end

  def test_destroy
    memo = Memo.new(1, 'title1', 'content1')

    actual = memo.destroy

    assert_equal 1, actual.id
    assert_equal 'title1', actual.title
    assert_equal 'content1', actual.content
  end

  def test_destroy_not_found
    memo = Memo.new(4, 'title1', 'content1')

    actual = memo.destroy

    assert_nil actual
  end
end
