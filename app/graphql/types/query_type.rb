module Types
  class QueryType < Types::BaseObject
    field :all_photos, [Types::PhotoType], null: false,
    description: "Returns all existing photos"

    field :photo_by_id, Types::PhotoType, null: false do
      description 'Find a photo by id'
      argument :id, ID, required: true
    end

    def all_photos
      Photo.all
    end

    def photo_by_id(id:)
      Photo.find(id)
    end
  end
end
