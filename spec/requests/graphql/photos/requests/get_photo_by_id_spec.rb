require 'rails_helper'

RSpec.describe Types::QueryType do
  before(:each) do
    @candy = Photo.create(source: 'app/assets/images/candy.jpg', title: 'Candy', description: 'I love all candy, but Smarties are my fave')
    @coding = Photo.create(source: 'app/assets/images/coding.jpeg', title: 'Coding', description: 'I am thrilled to be a programmer, and cannot wait to continue my learning journey')
    @coffee_and_rain = Photo.create(source: 'app/assets/images/coffee_and_rain.jpg', title: 'Coffee and Rain', description: 'I am incapable of living without my coffee, and I absolutely love the rain')
    @corgi = Photo.create(source: 'app/assets/images/corgi.jpeg', title: 'Corgi', description: 'Corgis are odd, but that is why I enjoy them')
    @tennis = Photo.create(source: 'app/assets/images/federer.jpg', title: 'Tennis', description: 'Tennis is a big part of my life, and Roger Federer is the GOAT. I admire his kindness, grace, and humility')
    @rivals = Photo.create(source: 'app/assets/images/friendly_rivals.jpg', title: 'Rivals', description: 'The greatest tennis rivals of all time. And at the same time, great friends')
    @golden_retriever = Photo.create(source: 'app/assets/images/golden_retriever.jpg', title: 'Golden Retriever', description: 'A best friend')
    @psychology = Photo.create(source: 'app/assets/images/psychology.png', title: 'Psychology', description: 'My other passion is studying the human mind and advocating for mental health')
  end

  it 'can query a photo by id' do
    post graphql_path, params: { query: query(id: @corgi.id) }
    result = JSON.parse(response.body)

    expect(result.count).to eq(1)
    expect(result["data"]["photoById"]).to have_key("id")
    expect(result["data"]["photoById"]["id"]).to eq(@corgi.id.to_s)
    expect(result["data"]["photoById"]).to have_key("source")
    expect(result["data"]["photoById"]["source"]).to eq(@corgi.source)
    expect(result["data"]["photoById"]).to have_key("title")
    expect(result["data"]["photoById"]["title"]).to eq(@corgi.title)
    expect(result["data"]["photoById"]).to have_key("description")
    expect(result["data"]["photoById"]["description"]).to eq(@corgi.description)
  end

  def query(id:)
    <<~GQL
    query {
      photoById(id: #{id}) {
        id
        source
        title
        description
      }
    }
    GQL
  end
end