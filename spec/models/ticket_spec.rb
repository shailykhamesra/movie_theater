require 'rails_helper'
RSpec.describe Ticket, type: :model do
  context 'validation test' do
    it 'is invalid without a price' do 
  	  FactoryGirl.build(:ticket, price: nil).should_not be_valid	
    end
    it 'is valid with a price' do 
  	  FactoryGirl.build(:ticket).should be_valid
    end
    it 'is of valid length' do 
  	  FactoryGirl.build(:ticket).should be_valid	
    end
    it 'is of invalid length' do 
  	  FactoryGirl.build(:ticket, price: nil).should_not be_valid
    end
  end
  context 'association' do
    it 'should belongs to showtime' do
      showtime= FactoryGirl.create(:showtime)
      ticket = FactoryGirl.create(:ticket ,showtime_id: showtime.id)
      ticket.showtime_id.should eq showtime.id
    end
    it 'should belongs to booking' do
      booking= FactoryGirl.create(:booking)
      ticket = FactoryGirl.create(:ticket ,booking_id: booking.id)
      ticket.booking_id.should eq booking.id
    end
    it 'should not belongs to showtime' do
      showtime1= FactoryGirl.create(:showtime)
      showtime2= FactoryGirl.create(:showtime)
      ticket = FactoryGirl.create(:ticket ,showtime_id: showtime1.id)
      ticket.showtime_id.should_not eq showtime2.id
    end
    it 'should not belongs to booking' do
      booking1= FactoryGirl.create(:booking)
      booking2= FactoryGirl.create(:booking)
      ticket = FactoryGirl.create(:ticket ,booking_id: booking1.id)
      ticket.booking_id.should_not eq booking2.id
    end
  end
end
