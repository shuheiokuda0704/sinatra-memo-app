class Memo
  attr_accessor :id, :title, :content

  JSON = 'db/memo.json'

  @@memos = File.read(JSON) do |file|
    JSON.load(file)
  end
  @@memos = JSON.parse(@@memos)
  
  def initialize(id, title, content)
    @id = id
    @title = title
    @content = content
  end

  def self.create(params)
    current_memos = @@memos['memos']
    next_id = @@memos['memos'].map{|memo| memo['id']}.max + 1
    @@memos['memos'] = current_memos.append({id: next_id, title: params[:title], content: params[:content]})

  end

  def update(params)
  end

  def self.all
    @@memos['memos'].map do |memo|
      Memo.new(memo['id'], memo['title'], memo['content'])
    end
  end

  def self.find(memo_id)
  end

  def destroy
  end

  private

  def save_json
    File.open(JSON, 'w') do |file|
      JSON.dump(@@memos, file)
    end
  end
end
