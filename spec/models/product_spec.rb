require 'rails_helper'

describe Product do
  context "when the product has comments" do

    before do
      @user = FactoryBot.create(:user)
      @product = FactoryBot.create(:product)
    # let(:product) { Product.create!(name: "Green Chair")}
    # let(:user) { User.create!(email: "courtneytyler12@yahoo.com", password: "abc-123")}
      @product.comments.create!(rating: 1, user: @user, body: "Terrible chair")
      @product.comments.create!(rating: 3, user: @user, body: "Okay chair")
      @product.comments.create!(rating: 5, user: @user, body: "Amazing chair")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3.0
    end

    it "is not valid without a name" do
      expect(Product.new(description: "Comfortable sofa")).not_to be_valid
    end

  end
end
