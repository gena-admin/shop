require 'rails_helper'

describe Api::V1::ProductsController, type: :controller do
  let(:customer) { FactoryGirl.create(:user, role: 'customer') }
  let!(:product){ FactoryGirl.create(:product) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(customer)
  end

  describe 'GET index' do
    it 'returns http success' do
      get 'index'
      expect(response).to be_success
    end

    it 'should return all Products' do

      get :index, {format: :json}
      binding.pry
    end
  end

  # describe 'GET show' do
  #   it 'returns http success' do
  #     get 'show'
  #     expect(response).to be_success
  #   end
  #
  #   it 'should return one product' do
  #     get 'show', params: { id: product.id}
  #     expect(assigns(:product)).to eql(product)
  #   end
  # end

  # describe 'GET new' do
  #   context 'when user is not admin' do
  #     it 'returns http error' do
  #       get 'new'
  #       expect(response).to_not be_success
  #     end
  #   end
  #
  #   context 'when user is admin' do
  #     let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  #
  #     it 'returns http success' do
  #       allow(controller).to receive(:current_user).and_return(admin)
  #       get 'new'
  #       expect(response).to be_success
  #     end
  #   end
  # end
  #
  # describe 'POST create' do
  #   let(:params) do
  #     {
  #       product: {
  #         name: 'Test name',
  #         brand: 'Brand',
  #         model: 'Model',
  #         sku: 'some sku',
  #         price: 123
  #       }
  #     }
  #   end
  #
  #   context 'when user is not admin' do
  #     it 'returns http error' do
  #       post 'create', params: params
  #       expect(response).to_not be_success
  #     end
  #   end
  #
  #   context 'when user is admin' do
  #     let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  #
  #     it 'returns http success' do
  #       allow(controller).to receive(:current_user).and_return(admin)
  #       post 'create', params: params
  #       expect(response.status).to eql(302)
  #       expect(flash[:notice]).to eql('Product was successfully created.')
  #     end
  #   end
  # end
  #
  # describe 'POST process_import' do
  #   let(:tmpfile) { Tempfile.new('export_data.log') }
  #   let(:params) do
  #     {
  #         gena: {
  #             file: OpenStruct.new({path: 'axsa'})
  #         }
  #     }
  #   end
  #
  #   context 'when user is not admin' do
  #     it 'returns http error' do
  #       post 'process_import', params: params
  #       expect(response).to_not be_success
  #     end
  #   end
  #
  #   # context 'when user is admin' do
  #   #   let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  #   #
  #   #   it 'returns http success' do
  #   #     allow(controller).to receive(:current_user).and_return(admin)
  #   #     allow(File).to receive(:read)
  #   #
  #   #     post 'process_import', params: params
  #   #     # expect(response.status).to eql(302)
  #   #     # expect(flash[:notice]).to eql('Product was successfully created.')
  #   #   end
  #   # end
  # end
end