class Message < ApplicationRecord
    # belongs_to :chat
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

  settings do
    mappings dynamic: false do
      indexes :chat_id, type: :integer
      indexes :app_id, type: :integer
      indexes :body, type: :text, analyzer: :english
    end
  end

  def self.search_elastic(query)
  self.search({
    query: {
      match:{
          body: query
      }
    }
  })
  end
end
