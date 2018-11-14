require 'rails_helper'

describe Comment do
  # Comment validation tests
  context "comment validation" do

    before(:each) do
      @user = FactoryBot.create(:random_user)
      @product = FactoryBot.create(:random_product)
    end

    it "creates valid comment" do
      @comment = FactoryBot.create(:random_comment,
        user_id: @user.id,
        product_id: @product.id
      )
      expect(@comment).to be_valid
    end

    it "is not valid without a rating" do
      expect(Comment.new(
        body: "text",
        user_id: @user.id,
        product_id: @product.id
        )).not_to be_valid
    end

    it "is not valid without a body" do
      expect(Comment.new(
        user_id: @user.id,
        product_id: @product.id,
        rating: 5
        )).not_to be_valid
    end

    it "is not valid without a user_id" do
      expect(Comment.new(
        body: "text",
        product_id: @product.id,
        rating: 5
        )).not_to be_valid
    end

    it "is not valid without a product_id" do
      expect(Comment.new(
        body: "text",
        user_id: @user.id,
        rating: 5
        )).not_to be_valid
    end


  end
end
