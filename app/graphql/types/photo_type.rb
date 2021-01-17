module Types
  class PhotoType < Types::BaseObject
    field :id, ID, null: false
    field :source, String, null: true
    field :title, String, null: true
    field :description, String, null: true
  end
end
