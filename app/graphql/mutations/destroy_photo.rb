module Mutations
  class DestroyPhoto < BaseMutation
    argument :id, ID, required: true
    field :photo, Types::PhotoType, null: true

    def resolve(id:)
      photo = Photo.find(id).destroy
      { photo: photo }
    end
  end
end
