# frozen_string_literal: true

require 'pg'

class Memo
  attr_accessor :id, :title, :content

  DB_NAME = 'memos'
  CONN = PG.connect(dbname: DB_NAME)

  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
  end

  def self.create(params)
    CONN.exec_params('INSERT INTO memos (title, content) VALUES ($1::text, $2::text);', [params[:title], params[:content]])
    res = CONN.exec('SELECT * FROM memos ORDER BY id DESC LIMIT 1').first
    Memo.new(res['id'].to_i, res['title'], res['content'])
  end

  def update(params)
    target = Memo.find(@id.to_i)
    return nil unless target

    CONN.exec('UPDATE memos SET title = $1::text, content = $2::text WHERE id = $3::int;', [params[:title], params[:content], @id.to_i])

    Memo.find(@id.to_i)
  end

  def self.all
    res = CONN.exec('SELECT * FROM memos ORDER BY id')
    res.map do |record|
      Memo.new(record['id'].to_i, record['title'], record['content'])
    end
  end

  def self.find(memo_id)
    res = CONN.exec("SELECT * FROM memos WHERE id = #{memo_id}").first
    return nil unless res

    Memo.new(res['id'].to_i, res['title'], res['content'])
  end

  def destroy
    target = Memo.find(@id.to_i)
    return nil unless target

    CONN.exec("DELETE FROM memos WHERE id = #{@id.to_i}")
    target
  end
end
