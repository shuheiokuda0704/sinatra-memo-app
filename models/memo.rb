class Memo
  attr_accessor :title, :content

  def initialize(title, content)
    @title = title
    @content = content
  end

  def self.create
  end

  def self.update(memo_id)
  end

  def self.all
    [ Memo.new("title1", "content1"), Memo.new("title2", "content2") ]
  end

  def self.find(memo_id)
  end

  def self.destroy(memo_id)
  end
end