require 'rails_helper'

RSpec.describe Book, type: :model do
  it "should have a valid factory" do
      expect(build(:book).save).to be_truthy
  end
  
  it { should validate_presence_of(:title) }
   
  it { should have_and_belong_to_many(:authors) }
end
