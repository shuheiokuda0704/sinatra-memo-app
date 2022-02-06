# frozen_string_literal: true

require 'json'

class Memo
  attr_accessor :id, :title, :content

  MEMO_JSON = 'db/memo.json'

  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
  end

  def self.create(params)
    load_json

    current_memos = @@memos['memos']
    next_id = @@memos['memos'].map { |memo| memo['id'] }.max + 1
    @@memos['memos'] = current_memos.append({ id: next_id, title: params[:title], content: params[:content] })
    save_json

    Memo.new(next_id, params[:title], params[:content])
  end

  def update(params)
    Memo.load_json

    updated = false
    @@memos['memos'] = @@memos['memos'].map do |memo|
      if memo['id'] == @id.to_i
        updated = true
        { id: memo['id'], title: params[:title], content: params[:content] }
      else
        memo
      end
    end

    return nil unless updated

    Memo.save_json
    Memo.new(@id.to_i, params[:title], params[:content])
  end

  def self.all
    load_json

    @@memos['memos'].map do |memo|
      Memo.new(memo['id'], memo['title'], memo['content'])
    end
  end

  def self.find(memo_id)
    load_json

    memo = @@memos['memos'].find { |memo| memo['id'] == memo_id.to_i }

    return nil unless memo

    Memo.new(memo['id'], memo['title'], memo['content'])
  end

  def destroy
    Memo.load_json

    target = Memo.find(@id.to_i)
    @@memos['memos'] = @@memos['memos'].reject { |memo| memo['id'] == @id.to_i }

    Memo.save_json

    target
  end

  def self.load_json
    json = File.read(MEMO_JSON) do |file|
      JSON.parse(file)
    end
    @@memos = JSON.parse(json)
  end

  def self.save_json
    File.open(MEMO_JSON, 'w') do |file|
      JSON.dump(@@memos, file)
    end
  end
end
