module Types
  class MutationType < Types::BaseObject
    field :add_photo, mutation: Mutations::AddPhoto, description: "Add a new photo"
  end
end
