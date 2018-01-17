require 'rails_helper'
RSpec.describe TicketsController, type: :controller do
  context 'GET index' do
    it 'should show all ticket successfully' do
      get :index, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context 'GET show' do
    it 'should show ticket with given id successfully' do
      ticket = FactoryGirl.create(:ticket)
      get :show, params: { id: ticket.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not show a valid ticket' do
      ticket = FactoryGirl.create(:ticket)
      ticket.destroy
      get :show, params: { id: ticket.id }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'GET new' do
    it 'should get new ticket successfully' do
      showtime = FactoryGirl.create(:showtime)
      booking = FactoryGirl.create(:booking)
      get :new, params:{ticket:{price: '1', showtime_id: showtime.id, booking_id: booking.id}}, format: 'json'
      response.should have_http_status(:ok)
    end
  end
  context  'GET edit' do
    it 'should get correct ticket successfully' do
      ticket = FactoryGirl.create(:ticket)
      get :edit, params: { id: ticket.id } ,format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not get correct ticket successfully' do
      ticket = FactoryGirl.create(:ticket)
      ticket.destroy
      get :edit, params: { id: ticket.id } ,format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end 
  end
  context 'POST create' do
    it 'should be a valid ticket creation' do
      showtime = FactoryGirl.create(:showtime)
      booking = FactoryGirl.create(:booking)
      post :create, params: { ticket: { price: "1", showtime_id: showtime.id, booking_id: booking.id } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid ticket creation' do
      booking1 = FactoryGirl.create(:booking)
      booking1.destroy
      showtime = FactoryGirl.create(:showtime)
      post :create, params:{ ticket: { price: '1', booking_id: booking1.id, showtime_id: showtime.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid ticket creation' do
      booking = FactoryGirl.create(:booking)
      showtime1 = FactoryGirl.create(:showtime)
      showtime1.destroy
      post :create, params:{ ticket: { price: '1', booking_id: booking.id, showtime_id: showtime1.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be a valid ticket creation' do
      booking = FactoryGirl.create(:booking)
      booking.destroy
      showtime = FactoryGirl.create(:showtime)
      showtime.destroy
      post :create, params:{ticket: { price: '1', booking_id: booking.id, showtime_id: showtime.id}}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'PUT update' do
    it 'should be valid movie updation' do
      ticket = FactoryGirl.create(:ticket)
      put :update, params: { id: ticket.id, ticket: { price: ticket.price } }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be valid ticket updation' do
      ticket = FactoryGirl.create(:ticket)
      ticket.destroy
      put :update, params: {id: ticket.id}, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
    it 'should not be valid ticket updation' do
      ticket = FactoryGirl.create(:ticket)
      booking1 = FactoryGirl.create(:booking)
      booking1.destroy
      showtime = FactoryGirl.create(:showtime)
      put :update, params: { id: ticket.id,showtime:{price: ticket.price, booking_id: booking1.id, showtime_id: showtime.id} }, format: 'json'
      response.should have_http_status(:unprocessable_entity)
    end
  end
  context 'DELETE destroy' do
    it 'should be valid movie deletion' do
      ticket = FactoryGirl.create(:ticket)
      delete :destroy, params: { id: ticket.id }, format: 'json'
      response.should have_http_status(:ok)
    end
    it 'should not be a valid screen deletion' do
      ticket1 = FactoryGirl.create(:ticket)
      ticket1.destroy
      delete :destroy, params: { id: ticket1.id }, format: 'json'
      response.should_not have_http_status(:ok)
    end
    it 'should not be a valid customer deletion with invalid id' do
      ticket = FactoryGirl.create(:ticket)
      delete :destroy, params: { id: "" }, format: 'json'
      response.should_not have_http_status(:ok)
    end
  end
end
