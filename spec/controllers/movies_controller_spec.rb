require 'rails_helper'
RSpec.describe MoviesController, type: :controller do
  context 'GET index' do
    it 'should show all movie successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show movie with given id successfully' do
      movie = FactoryGirl.create(:movie)
      get :show, params: { id: movie.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid movie ' do
      movie = FactoryGirl.create(:movie)
      movie.destroy
      get :show, params: { id: movie.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
  context 'GET new' do
    it 'should get new movie successfully' do
      movie = FactoryGirl.create(:movie)
      movie.destroy
      get :new, params:{movie:{name:movie.name}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET edit' do
    it 'should get correct movies successfully' do
      movie = FactoryGirl.create(:movie)
      get :edit, params: { id: movie.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should get correct movie successfully' do
      movie = FactoryGirl.create(:movie)
      movie.destroy
      get :edit, params: { id: movie.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid movie creation' do
      post :create, params: { movie: { name: "ascd" } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not create a movie with valid name' do
      post :create, params: { movie: { name: nil } }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid movie updation' do
      movie = FactoryGirl.create(:movie)
      put :update, params: { id: movie.id, movie: { name: movie.name } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be valid movie updation' do
      movie = FactoryGirl.create(:movie)
      movie.destroy
      put :update, params: {id: movie.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid movie updation' do
      movie = FactoryGirl.create(:movie)
      put :update, params: { id: movie.id,movie:{name: ""} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid movie deletion' do
      movie = FactoryGirl.create(:movie)
      delete :destroy, params: { id: movie.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      delete :destroy, params: { id: ""}, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
