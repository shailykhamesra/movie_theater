require 'rails_helper'
RSpec.describe ScreensController, type: :controller do
  context 'GET index' do
    it 'should show all screen successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show screen with given id successfully' do
      screen = FactoryGirl.create(:screen)
      get :show, params: { id: screen.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid screens' do
      screen = FactoryGirl.create(:screen)
      screen.destroy
      get :show, params: { id: screen.id }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'edit' do
    it 'should get correct bookings successfully' do
      screen = FactoryGirl.create(:screen)
      get :edit, params: { id: screen.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not get correct bookings successfully' do
      screen = FactoryGirl.create(:screen)
      screen.destroy
      get :edit, params: { id: screen.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new screen successfully' do
      theater = FactoryGirl.create(:theater)
      movie = FactoryGirl.create(:movie)
      get :new, params:{screen:{number: nil, theater_id: theater.id, movie_id: movie.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'POST create' do
    it 'should be a valid screen creation' do
      theater = FactoryGirl.create(:theater)
      movie = FactoryGirl.create(:movie)
      post :create, params:{ screen: { number: '1', theater_id: theater.id, movie_id: movie.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid screen creation' do
      theater1 = FactoryGirl.create(:theater)
      theater1.destroy
      movie = FactoryGirl.create(:movie)
      post :create, params:{ screen: { number: '1', theater_id: theater1.id, movie_id: movie.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid screen creation' do
      theater = FactoryGirl.create(:theater)
      movie1 = FactoryGirl.create(:movie)
      movie1.destroy
      post :create, params:{ screen: { number: '1', theater_id: theater.id, movie_id: movie1.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid screen creation' do
      theater = FactoryGirl.create(:theater)
      theater.destroy
      movie = FactoryGirl.create(:movie)
      movie.destroy
      post :create, params:{screen: { number: '1', theater_id: theater.id, movie_id: movie.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid screen updation' do
      screen = FactoryGirl.create(:screen)
      put :update, params: { id: screen.id,screen:{number: '1'} }, format: 'json'
      screen1=Screen.last
      screen1.number.should eq 1
      response.should have_http_status(:ok)
    end
    it 'should not be valid screen updation' do
      screen = FactoryGirl.create(:screen)
      screen.destroy
      put :update, params: {id: screen.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid screen updation' do
      screen = FactoryGirl.create(:screen)
      theater1 = FactoryGirl.create(:theater)
      theater1.destroy
      movie = FactoryGirl.create(:movie)
      put :update, params: { id: screen.id,screen:{number: screen.number, theater_id: theater1.id, movie_id: movie.id} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid screen deletion' do
      screen = FactoryGirl.create(:screen)
      delete :destroy, params: { id: screen.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid screen deletion' do
      screen1 = FactoryGirl.create(:screen)
      screen1.destroy
      delete :destroy, params: { id: screen1.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid screen deletion' do
      delete :destroy, params: { id: "" }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end 
end
