# frozen_string_literal: true

require 'pg'

class Memo
  attr_accessor :id, :title, :content

  DB_NAME = 'memos'
  @class_conn = PG.connect(dbname: DB_NAME)

  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
    @instance_conn = PG.connect(dbname: DB_NAME)
  end

  def self.create(params)
    @class_conn.exec_params('INSERT INTO memos (title, content) VALUES ($1::text, $2::text);', [params[:title], params[:content]])
    res = @class_conn.exec('SELECT * FROM memos ORDER BY id DESC LIMIT 1').first
    Memo.new(res['id'].to_i, res['title'], res['content'])
  end

  def update(params)
    target = Memo.find(@id.to_i)
    return nil unless target

    @instance_conn.exec_params('UPDATE memos SET title = $1::text, content = $2::text WHERE id = $3::int;', [params[:title], params[:content], @id.to_i])

    Memo.find(@id.to_i)
  end

  def self.all
    res = @class_conn.exec('SELECT * FROM memos ORDER BY id')
    res.map do |record|
      Memo.new(record['id'].to_i, record['title'], record['content'])
    end
  end

  def self.find(memo_id)
    res = @class_conn.exec_params('SELECT * FROM memos WHERE id = $1::int', [memo_id.to_i]).first
    return nil unless res

    Memo.new(res['id'].to_i, res['title'], res['content'])
  end

  def destroy
    target = Memo.find(@id.to_i)
    return nil unless target

    @instance_conn.exec_params('DELETE FROM memos WHERE id = $1::int', [@id.to_i])
    target
  end
end
