require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'validations' do
    it {should validate_presence_of :url}
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
  end
end
