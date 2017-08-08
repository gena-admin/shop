require 'rails_helper'

describe Api::V1::ProductsController, type: :controller do
  render_views
  let(:customer) { FactoryGirl.create(:user, role: 'customer') }
  let!(:product_1){ FactoryGirl.create(:product) }
  let!(:product_2){ FactoryGirl.create(:product) }
  subject { JSON.parse(response.body) }

  # before do
  # end

  describe 'GET index' do
    it 'returns http success' do
      get 'index', { format: :json }
      expect(response).to be_success
    end

    it 'should return all Products' do
      get :index, { format: :json }

      is_expected.to eql([
        { 'id' => product_1.id,
          'name' => product_1.name,
          'brand' => product_1.brand,
          'model' =>product_1.model,
          'sku' => product_1.sku,
          'price' => product_1.price,
          'desc' => product_1.desc,
          'created_at' => product_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
          'updated_at' => product_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
          'url' => product_url(product_1, format: :json)
        },
        { 'id' => product_2.id,
          'name' => product_2.name,
          'brand' => product_2.brand,
          'model' =>product_2.model,
          'sku' => product_2.sku,
          'price' => product_2.price,
          'desc' => product_2.desc,
          'created_at' => product_2.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
          'updated_at' => product_2.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
          'url' => product_url(product_2, format: :json)
        },
      ])
    end
  end

  describe 'GET show' do
    it 'returns http success' do
      get 'show',{params: { id: product_1.id }, format: :json }

      expect(response).to be_success
    end

    it 'should return one product' do
      get 'show', { params: { id: product_1.id }, format: :json }

      is_expected.to eql(
        { 'id' => product_1.id,
          'name' => product_1.name,
          'brand' => product_1.brand,
          'model' =>product_1.model,
          'sku' => product_1.sku,
          'price' => product_1.price,
          'desc' => product_1.desc,
          'created_at' => product_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
          'updated_at' => product_1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
          'url' => product_url(product_1, format: :json)
        })
    end
  end

  describe 'POST create' do
    let(:params) do
      {
        product: {
          name: 'Test name',
          brand: 'Brand',
          model: 'Model',
          sku: 'some sku',
          price: 123,
          desc: 'Test desc'
        }
      }
    end

    it 'returns http error' do
      post 'create', { params: params, format: :json }
      created_product = assigns(:product)

      is_expected.to eql({
         'id' => created_product.id,
         'name' => 'Test name',
         'brand' => 'Brand',
         'model' => 'Model',
         'sku' => 'some sku',
         'price' => 123.0,
         'desc' => 'Test desc',
         'created_at' => created_product.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
         'updated_at' => created_product.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
         'url' => product_url(created_product, format: :json)
       })
    end
  end

  describe 'POST update_price' do
    it 'returns http error' do
      put 'update_price', { params: { product_id: product_1.id, price: 10 }, format: :json }
      updated_product = assigns(:product)

      is_expected.to eql({
        'id' => product_1.id,
        'name' => product_1.name,
        'brand' => product_1.brand,
        'model' =>product_1.model,
        'sku' => product_1.sku,
        'price' => 10.0,
        'desc' => product_1.desc,
        'created_at' => product_1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
        'updated_at' => updated_product.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'),
        'url' => product_url(product_1, format: :json)
      })
    end
  end
end