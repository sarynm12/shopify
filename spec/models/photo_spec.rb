require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'validations' do
    it {should validate_presence_of :source}
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
  end
end
