module Types
  class QueryType < Types::BaseObject
    field :all_photos, [Types::PhotoType], null: false,
    description: "Returns all existing photos"

    def all_photos
      Photo.all 
    end
  end
end
