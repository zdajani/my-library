require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should have a valid factory" do
      expect(build(:book).save).to be_truthy
  end
  
  it { should validate_presence_of(:first_name) }
  
  it { should validate_presence_of(:last_name) }
   
  it { should have_and_belong_to_many(:books) }
end
