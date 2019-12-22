json.extract! comment, :id, :message, :title, :created_at, :updated_at
json.url comment_url(comment, format: :json)
