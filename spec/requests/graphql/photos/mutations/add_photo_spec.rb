require 'rails_helper'

RSpec.describe Types::MutationType do
  describe 'photos' do
    it 'can create a new photo' do
      @user = create(:user)
      post graphql_path, params: { query: query }
      result = JSON.parse(response.body)
  
      expect(result["data"]).to have_key("addPhoto")
      expect(result["data"]["addPhoto"]).to have_key("photo")
      expect(result["data"]["addPhoto"]["photo"]).to have_key("source")
      expect(result["data"]["addPhoto"]["photo"]["source"]).to eq("Google")
      expect(result["data"]["addPhoto"]["photo"]).to have_key("title")
      expect(result["data"]["addPhoto"]["photo"]["title"]).to eq("Tennis")
      expect(result["data"]["addPhoto"]["photo"]).to have_key("description")
      expect(result["data"]["addPhoto"]["photo"]["description"]).to eq("US Open")
      expect(result["data"]["addPhoto"]["photo"]).to have_key("userId")
      expect(result["data"]["addPhoto"]["photo"]["userId"]).to eq(@user.id.to_s)
    end
  end

  def query
    <<~GQL
    mutation {
      addPhoto(
        input: {
          source: "Google",
          title: "Tennis",
          description: "US Open",
          userId: #{@user.id}
        }
      )
      {
        photo {
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
