module Types
  class MutationType < Types::BaseObject
    field :add_photo, mutation: Mutations::AddPhoto, description: "Add a new photo"
    field :destroy_photo, mutation: Mutations::DestroyPhoto, description: "Destroy an existing photo"
  end
end
