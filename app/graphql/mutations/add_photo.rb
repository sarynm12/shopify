module Mutations
  class AddPhoto < BaseMutation
    argument :source, String, required: true
    argument :title, String, required: true
    argument :description, String, required: true
    argument :user_id, ID, required: true

    field :photo, Types::PhotoType, null: true
    field :errors, [String], null: false

    def resolve(source: nil, title: nil, description: nil, user_id: nil)
      photo = Photo.create!(
        source: source,
        title: title,
        description: description,
        user_id: user_id
      )

      if photo.save
        { photo: photo }
      else
        { errors: photo.errors.full_messages }
      end
    end
  end
end
