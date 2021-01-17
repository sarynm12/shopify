require 'rails_helper'

RSpec.describe Types::QueryType do
  it 'can query a photo by id' do
    user1 = create(:user)
    photo1 = create(:photo, user: user1)
    user2 = create(:user)
    photo2 = create(:photo, user: user2)
    post graphql_path, params: { query: query1(id: user1.photos.first.id) }
    result = JSON.parse(response.body)

    expect(result.count).to eq(1)
    expect(result["data"]["photoById"]).to have_key("id")
    expect(result["data"]["photoById"]["id"]).to eq(user1.photos.first.id.to_s)
    expect(result["data"]["photoById"]).to have_key("source")
    expect(result["data"]["photoById"]["source"]).to eq(photo1.source)
    expect(result["data"]["photoById"]).to have_key("title")
    expect(result["data"]["photoById"]["title"]).to eq(photo1.title)
    expect(result["data"]["photoById"]).to have_key("description")
    expect(result["data"]["photoById"]["description"]).to eq(photo1.description)
    expect(result["data"]["photoById"]).to have_key("userId")
    expect(result["data"]["photoById"]["userId"]).to eq(user1.id.to_s)
  end

  def query1(id:)
    <<~GQL
    query {
      photoById(id: #{id}) {
        id
        source
        title
        description
        userId
      }
    }
    GQL
  end
end
