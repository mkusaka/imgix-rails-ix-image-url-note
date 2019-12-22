class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :message, type: String
  field :title, type: String
end
