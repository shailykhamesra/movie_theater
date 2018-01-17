require 'rails_helper'
RSpec.describe ShowtimesController, type: :controller do
  context 'GET index' do
    it 'should show all movie successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show movie with given id successfully' do
      showtime = FactoryGirl.create(:showtime)
      get :show, params: { id: showtime.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid showtimes' do
      showtime = FactoryGirl.create(:showtime)
      showtime.destroy
      get :show, params: { id: showtime.id }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new showtime successfully' do
      screen = FactoryGirl.create(:screen)
      movie = FactoryGirl.create(:movie)
      get :new, params:{screen:{timings: "2017-02-02 22:02:30", screen_id: screen.id, movie_id: movie.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context  'GET edit' do
    it 'should get correct showtimess successfully' do
      showtime = FactoryGirl.create(:showtime)
      get :edit, params: { id: showtime.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should notget correct showtimess successfully' do
      showtime = FactoryGirl.create(:showtime)
      showtime.destroy
      get :edit, params: { id: showtime.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid showtime creation' do
      movie = FactoryGirl.create(:movie)
      screen = FactoryGirl.create(:screen)
      post :create, params: { showtime: { timings: "2017-02-02 22:02:30", movie_id: movie.id, screen_id: screen.id } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid showtime creation' do
      movie1 = FactoryGirl.create(:movie)
      movie1.destroy
      screen = FactoryGirl.create(:screen)
      post :create, params:{ showtime: { timings: "2017-02-02 22:02:30", screen_id: screen.id, movie_id: movie1.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid showtime creation' do
      screen1 = FactoryGirl.create(:screen)
      movie = FactoryGirl.create(:movie)
      screen1.destroy
      post :create, params:{ screen: { timings: "2017-02-02 22:02:30", screen_id: screen1.id, movie_id: movie.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid showtime creation' do
      screen = FactoryGirl.create(:screen)
      screen.destroy
      movie = FactoryGirl.create(:movie)
      movie.destroy
      post :create, params:{screen: { timings: "2017-02-02 22:02:30", screen_id: screen.id, movie_id: movie.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid movie updation' do
      showtime = FactoryGirl.create(:showtime)
      put :update, params: { id: showtime.id, showtime: { timings: showtime.timings } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be valid screen updation' do
      showtime = FactoryGirl.create(:showtime)
      showtime.destroy
      put :update, params: {id: showtime.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid screen updation' do
      showtime = FactoryGirl.create(:showtime)
      screen1 = FactoryGirl.create(:screen)
      screen1.destroy
      movie = FactoryGirl.create(:movie)
      put :update, params: { id: showtime.id,showtime:{timings: showtime.timings, screen_id: screen1.id, movie_id: movie.id} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid movie deletion' do
      showtime = FactoryGirl.create(:showtime)
      delete :destroy, params: { id: showtime.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid screen deletion' do
      showtime1 = FactoryGirl.create(:showtime)
      showtime1.destroy
      delete :destroy, params: { id: showtime1.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid showtime deletion with invalid id' do
      delete :destroy, params: { id: ""}, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
