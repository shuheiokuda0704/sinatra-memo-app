# frozen_string_literal: true

require 'json'

# Public API to load and save db.json
class JsonDb
  DB_JSON = 'db/db.json'

  def self.load_json
    json = File.read(DB_JSON) do |file|
      JSON.parse(file)
    end

    JSON.parse(json, symbolize_names: true)
  end

  def self.save_json(memos)
    File.open(DB_JSON, 'w') do |file|
      JSON.dump(memos, file)
    end
  end
end
