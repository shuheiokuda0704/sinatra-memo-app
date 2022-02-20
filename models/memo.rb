# frozen_string_literal: true

require_relative '../db/json_db'

class Memo
  attr_accessor :id, :title, :content

  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
  end

  def self.create(params)
    memos = JsonDb.load_json

    next_id = memos[:memos].map { |memo| memo[:id] }.max + 1
    memo = Memo.new(next_id, params[:title], params[:content])
    memos[:memos] = memos[:memos].append({ id: memo.id, title: memo.title, content: memo.content })
    JsonDb.save_json(memos)

    memo
  end

  def update(params)
    memos = JsonDb.load_json

    index = memos[:memos].find_index { |memo| memo[:id] == @id.to_i }
    return nil unless index

    memos[:memos][index][:title] = params[:title]
    memos[:memos][index][:content] = params[:content]

    JsonDb.save_json(memos)
    Memo.find(@id.to_i)
  end

  def self.all
    memos = JsonDb.load_json

    memos[:memos].map do |memo|
      Memo.new(memo[:id], memo[:title], memo[:content])
    end
  end

  def self.find(memo_id)
    memos = JsonDb.load_json

    memo = memos[:memos].find { |m| m[:id] == memo_id.to_i }
    return nil unless memo

    Memo.new(memo[:id], memo[:title], memo[:content])
  end

  def destroy
    memos = JsonDb.load_json
    target = Memo.find(@id.to_i)
    return nil unless target

    memos[:memos] = memos[:memos].reject { |memo| memo[:id] == @id.to_i }

    JsonDb.save_json(memos)
    target
  end
end
