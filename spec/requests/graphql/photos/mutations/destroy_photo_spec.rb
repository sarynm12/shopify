require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'photos' do
    it 'can destroy a photo' do
      @user = create(:user)
      @photo = create(:photo, user: @user)
      post graphql_path, params: { query: query(@photo.id) }
      result = JSON.parse(response.body)
  
      expect(result["data"]).to have_key("destroyPhoto")
      expect(result["data"]["destroyPhoto"]).to have_key("photo")
      expect(result["data"]["destroyPhoto"]["photo"]).to have_key("source")
      expect(result["data"]["destroyPhoto"]["photo"]["source"]).to eq(@photo.source)
      expect(result["data"]["destroyPhoto"]["photo"]).to have_key("title")
      expect(result["data"]["destroyPhoto"]["photo"]["title"]).to eq(@photo.title)
      expect(result["data"]["destroyPhoto"]["photo"]).to have_key("description")
      expect(result["data"]["destroyPhoto"]["photo"]["description"]).to eq(@photo.description)
      expect(result["data"]["destroyPhoto"]["photo"]).to have_key("userId")
      expect(result["data"]["destroyPhoto"]["photo"]["userId"]).to eq(@user.id.to_s)
    end
  end

  def query(id)
    <<~GQL
    mutation {
      destroyPhoto(
        input: {
          id: #{id}
        }
      )
      {
        photo {
          id
          source
          title
          description
          userId
        }
      }
    }
    GQL
  end
end
