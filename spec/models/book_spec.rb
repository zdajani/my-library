require 'rails_helper'

RSpec.describe Book, type: :model do
  it "has a valid factory" do
      expect(build(:book).save).to be_truthy
  end
  
  it { should validate_presence_of(:title) }
end
