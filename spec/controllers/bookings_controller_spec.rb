require 'rails_helper'
RSpec.describe BookingsController, type: :controller do
  context 'GET index' do
    it 'should show all booking successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show booking with given id successfully' do
      booking = FactoryGirl.create(:booking)
      get :show, params: { id: booking.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid booking' do
      booking = FactoryGirl.create(:booking)
      booking.destroy
      get :show, params: { id: booking.id }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new booking successfully' do
      booking = FactoryGirl.create(:booking)
      get :new, params:{screen:{name:"qqq", phone:"1234567890", credircard:"1234567890", booking_id: booking.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context  'GET edit' do
    it 'should get correct bookings successfully' do
      booking = FactoryGirl.create(:booking)
      get :edit, params: { id: booking.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should get correct bookings successfully' do
      booking = FactoryGirl.create(:booking)
      booking.destroy
      get :edit, params: { id: booking.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'POST create' do
    it 'should be a valid booking creation' do
      showtime = FactoryGirl.create(:showtime)
      post :create, params: { booking: { name:"qqq" , phone:"1234567890" , creditcard: "1234567890", showtime_id: showtime.id } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid booking creation' do
      showtime1 = FactoryGirl.create(:showtime)
      showtime1.destroy
      post :create, params:{ booking: { name:"qqq", phone:"1234567890" , creditcard: "1234567890", showtime_id: showtime1.id }}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid booking updation' do
      booking = FactoryGirl.create(:booking)
      put :update, params: { id: booking.id, booking: { name: booking.name, phone: booking.phone, creditcard:booking.creditcard } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be valid booking updation' do
      booking = FactoryGirl.create(:booking)
      booking.destroy
      put :update, params: {id: booking.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid booking updation' do
      showtime1 = FactoryGirl.create(:showtime)
      showtime1.destroy
      booking = FactoryGirl.create(:booking)
      put :update, params: { id: showtime1.id,booking:{name: booking.name, phone: booking.phone, creditcard:booking.creditcard , showtime_id: showtime1.id} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid booking deletion' do
      booking = FactoryGirl.create(:booking)
      delete :destroy, params: { id: booking.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid screen deletion' do
      booking1 = FactoryGirl.create(:booking)
      booking1.destroy
      delete :destroy, params: { id: booking1.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      delete :destroy, params: { id: "" }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
