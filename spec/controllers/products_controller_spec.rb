require 'rails_helper'

describe ProductsController, type: :controller do

  before(:each) do
    @admin = FactoryBot.create(:random_user, admin: true)
    @user = FactoryBot.create(:random_user)
    @product = FactoryBot.create(:random_product)
  end

  describe '#index' do

    context 'user not logged in' do
      it 'gets the index' do
        get :index
        expect(response).to be_ok
      end
    end

    context 'user is admin and signed in' do
      it 'gets the index' do
        sign_in @admin
        get :index
        expect(response).to be_ok
      end
    end

    context 'user is signed in but not admin' do
      it 'gets the index' do
        sign_in @user
        get :index
        expect(response).to be_ok
      end
    end

  end


  describe '#show' do

    context 'user is not signed in' do
      it 'redirects to sign in page' do
        get :show, params: { id: @product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'user is admin and signed in' do
      it 'gets the product show page' do
        sign_in @admin
        get :show, params: { id: @product.id }
        expect(response).to be_ok
      end
    end

    context 'user is signed in but not admin' do
      it 'gets the product show page' do
        sign_in @user
        get :show, params: { id: @product.id }
        expect(response).to be_ok
      end
    end

  end

  describe '#new' do

    context 'user is signed in and is admin' do
      it 'renders new product template' do
        sign_in @admin
        get :new
        expect(response).to render_template('new')
      end
    end

  end

  describe '#edit' do

    context 'user is not signed in' do
      it 'redirects to sign in page' do
        get :edit, params: { id @product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'user is signed in but not admin' do
      it 'is unsuccessful' do
        sign_in @user
        get :edit, params: { id @product.id }
        expect(response).to have_http_status(401)
      end
    end

    context 'user is admin and signed in' do
      it 'gets the product edit page' do
        sign_in @admin
        get :edit, params: { id: @product.id }
        expect(response).to be_ok
      end
    end

  end

  describe '#create' do

    context 'user is admin and signed in' do
      it 'creates product' do
        sign_in @admin
        @product_ok = FactoryBot.create(:random_product, name: "RandomProduct" )
        expect(response).to be_ok
        expect(@product_ok.name).to eq("RandomProduct")
      end
    end

    let(:no_color_product) { FactoryBot.create(:random_product) }
    context "admin creates product without color" do
      it 'does not successfully create the product' do
        sign_in @admin
        no_color_product.color = nil
        post :create, params: { product: no_color_product.attributes }
        expect(response).to render_template('new')
      end
    end

  end

  describe '#update' do

    context 'user is admin and signed in' do
      it 'updates the product' do
        sign_in @admin
        patch :update, params { id @product.id, product: { :name => "New Name"}}
        expect(response).to be_redirect
      end
    end

  end

  describe '#destroy' do

    context 'user is not signed in' do
      it 'redirects to sign in page' do
        delete :destroy, params: { id: @product.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'user is signed in but not admin' do
      it 'is unsuccessful' do
        sign_in @user
        delete :destroy, params: { id: @product.id }
        expect(response).to have_http_status(401)
      end
    end

  end

end
