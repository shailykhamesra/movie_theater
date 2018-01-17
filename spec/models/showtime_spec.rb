require 'rails_helper'
RSpec.describe Showtime, type: :model do
  context 'validation test' do
    it 'is invalid without a time' do 
  	  FactoryGirl.build(:showtime, timings: nil).should_not be_valid	
    end
    it 'is valid with a time' do 
  	  FactoryGirl.build(:showtime).should be_valid
    end
    it 'is of valid length' do 
  	  FactoryGirl.build(:showtime).should be_valid	
    end
    it 'is of invalid length' do 
  	  FactoryGirl.build(:showtime, timings: nil).should_not be_valid
    end
  end
  context 'association' do
    it 'should belongs to screen' do
     movie= FactoryGirl.create(:movie)
     showtime = FactoryGirl.create(:showtime ,movie_id: movie.id)
     showtime.movie_id.should eq movie.id
    end
    it 'should belongs to screen' do
     screen= FactoryGirl.create(:screen)
     showtime = FactoryGirl.create(:showtime ,screen_id: screen.id)
     showtime.screen_id.should eq screen.id
    end
    it 'should have many bookings' do
      showtime = FactoryGirl.create(:showtime)
      booking1 = FactoryGirl.create(:booking, showtime_id: showtime.id)
      booking2 = FactoryGirl.create(:booking, showtime_id: showtime.id)
      booking3 = FactoryGirl.create(:booking, showtime_id: showtime.id)
      booking1.showtime.id.should eq showtime.id and booking2.showtime.id.should eq showtime.id and booking3.showtime.id.should eq showtime.id
    end  
    it 'should have many bookings' do
      showtime = FactoryGirl.create(:showtime)
      ticket1 = FactoryGirl.create(:ticket, showtime_id: showtime.id)
      ticket2 = FactoryGirl.create(:ticket, showtime_id: showtime.id)
      ticket3 = FactoryGirl.create(:ticket, showtime_id: showtime.id)
      ticket1.showtime.id.should eq showtime.id and ticket2.showtime.id.should eq showtime.id and ticket3.showtime.id.should eq showtime.id
    end  
    it 'should belongs to screen' do
      movie1= FactoryGirl.create(:movie)
      movie2= FactoryGirl.create(:movie)
      showtime = FactoryGirl.create(:showtime ,movie_id: movie1.id)
      showtime.movie_id.should_not eq movie2.id
    end
    it 'should belongs to screen' do
      screen1= FactoryGirl.create(:screen)
      screen2= FactoryGirl.create(:screen)
      showtime = FactoryGirl.create(:showtime ,screen_id: screen1.id)
      showtime.screen_id.should_not eq screen2.id
    end
    it 'should have many bookings' do
      showtime1 = FactoryGirl.create(:showtime)
      showtime2 = FactoryGirl.create(:showtime)
      booking1 = FactoryGirl.create(:booking, showtime_id: showtime1.id)
      booking2 = FactoryGirl.create(:booking, showtime_id: showtime2.id)
      booking1.showtime.id.should_not eq showtime2.id 
      booking2.showtime.id.should_not eq showtime1.id 
    end  
  end
end
