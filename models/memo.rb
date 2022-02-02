class Memo
  attr_accessor :id, :title, :content

  @@memos = File.read('db/memo.json') do |file|
    JSON.load(file)
  end
  @@memos = JSON.parse(@@memos)
  
  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
  end

  def self.create(params)
  end

  def self.update(memo_id)
  end

  def self.all
    @@memos['memos'].map do |memo|
      Memo.new(memo['id'], memo['title'], memo['content'])
    end
  end

  def self.find(memo_id)
  end

  def self.destroy(memo_id)
  end
end
