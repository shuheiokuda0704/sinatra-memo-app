# frozen_string_literal: true

require 'minitest/autorun'
require './models/memo'

system('./scripts/initiate_db.sh')

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
    memo = Memo.find(Memo.all.last.id)
    params = { title: 'title', content: 'content' }
    actual = memo.update(params)

    assert_equal 'title', actual.title
    assert_equal 'content', actual.content
  end

  def test_update_nil
    memo = Memo.new(Memo.all.last.id + 1, 'title1', 'content1')
    params = { title: 'title', content: 'content' }
    actual = memo.update(params)

    assert_nil actual
  end

  def test_all
    memos = Memo.all
    expected_memos = [Memo.new(1, 'title1', 'content1'),
                      Memo.new(2, 'title2', 'content2')]

    expected_memos.each_with_index do |expected, index|
      assert_equal expected.id, memos[index].id
      assert_equal expected.title, memos[index].title
      assert_equal expected.content, memos[index].content
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
    memo = Memo.find(Memo.all.last.id + 1)

    assert_nil memo
  end

  def test_destroy
    memo = Memo.all.last
    actual = memo.destroy

    assert_equal memo.id, actual.id
    assert_equal memo.title, actual.title
    assert_equal memo.content, actual.content
  end

  def test_destroy_not_found
    memo = Memo.new(Memo.all.last.id + 1, 'title1', 'content1')

    actual = memo.destroy

    assert_nil actual
  end
end
