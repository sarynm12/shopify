require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'relationships' do
    it {should belong_to :user}
  end
  describe 'validations' do
    it {should validate_presence_of :source}
    it {should validate_presence_of :title}
    it {should validate_presence_of :description}
  end
end
