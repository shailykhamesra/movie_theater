require 'rails_helper'
RSpec.describe TheatersController, type: :controller do
  context 'GET index' do
    it 'should show all theater successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show theater with given id successfully' do
      theater = FactoryGirl.create(:theater)
      get :show, params: { id: theater.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid theater ' do
      theater = FactoryGirl.create(:theater)
      theater.destroy
      get :show, params: { id: theater.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
  context  'GET edit' do
    it 'should get correct theater successfully' do
      theater = FactoryGirl.create(:theater)
      get :edit, params: { id: theater.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should get correct bookings successfully' do
      theater = FactoryGirl.create(:theater)
      theater.destroy
      get :edit, params: { id: theater.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new screen successfully' do
      get :new, params:{theater:{name: nil, address: nil}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'POST create' do
    it 'should be a valid theater creation' do
      post :create, params: { theater: { name: "zzz", address: "qqq" } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not create a theater with valid name' do
      post :create, params: { theater: { name: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not create a theater with valid address' do
      post :create, params: { theater: { address: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid theater updation' do
      theater = FactoryGirl.create(:theater)
      put :update, params: { id: theater.id, theater: { name: 'a', address: 'abc' } }, format: 'json'
      theater1=Theater.last
      theater1.name.should eq 'a'
      response.should have_http_status(:ok)
    end
    it 'should not be valid theater updation' do
      theater = FactoryGirl.create(:theater)
      theater.destroy
      put :update, params: {id: theater.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid theater updation' do
      theater = FactoryGirl.create(:theater)
      put :update, params: { id: theater.id,theater:{name: ""} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid theater updation' do
      theater = FactoryGirl.create(:theater)
      put :update, params: { id: theater.id,theater:{address: ""} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid theater deletion' do
      theater = FactoryGirl.create(:theater)
      delete :destroy, params: { id: theater.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid theater deletion with invalid id' do
      delete :destroy, params: { id: "" }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
