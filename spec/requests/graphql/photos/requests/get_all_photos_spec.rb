require 'rails_helper'

RSpec.describe Types::QueryType do
  it 'can query all photos' do
    user = create(:user)
    photos = create_list(:photo, 8, user: user)
    post graphql_path, params: { query: query }
    result = JSON.parse(response.body)

    expect(result["data"]["allPhotos"].count).to eq(8)
    expect(result["data"]["allPhotos"][0]).to have_key("id")
    expect(result["data"]["allPhotos"][0]).to have_key("source")
    expect(result["data"]["allPhotos"][0]).to have_key("title")
    expect(result["data"]["allPhotos"][0]).to have_key("description")
  end

  def query
    <<~GQL
    query {
      allPhotos {
        id
        source
        title
        description
      }
    }
    GQL
  end
end
