require 'rails_helper'
RSpec.describe Screen, type: :model do
  context 'validation test' do
    it 'is invalid without a number' do 
  	  FactoryGirl.build(:screen, number: nil).should_not be_valid	
    end
    it 'is valid with a number' do 
  	  FactoryGirl.build(:screen).should be_valid
    end
    it 'is of valid length' do 
  	  FactoryGirl.build(:screen).should be_valid	
    end
    it 'is of invalid length' do 
  	  FactoryGirl.build(:screen, number: nil).should_not be_valid
    end
  end
  context 'association' do
    it 'should belongs to theater' do
     theater= FactoryGirl.create(:theater)
     screen = FactoryGirl.create(:screen ,theater_id: theater.id)
     screen.theater_id.should eq theater.id
    end
    it 'should belongs to movie' do
     movie= FactoryGirl.create(:movie)
     screen = FactoryGirl.create(:screen ,movie_id: movie.id)
     screen.movie_id.should eq movie.id
    end
    it 'should have many showtimes' do
      screen = FactoryGirl.create(:screen)
      showtime1 = FactoryGirl.create(:showtime, screen_id: screen.id)
      showtime2 = FactoryGirl.create(:showtime, screen_id: screen.id)
      showtime3 = FactoryGirl.create(:showtime, screen_id: screen.id)
      showtime1.screen.id.should eq screen.id and showtime2.screen.id.should eq screen.id and showtime3.screen.id.should eq screen.id
    end  
    it 'should belongs to theater' do
      theater1= FactoryGirl.create(:theater)
      theater2= FactoryGirl.create(:theater)
      screen = FactoryGirl.create(:screen ,theater_id: theater1.id)
      screen.theater_id.should_not eq theater2.id
    end
    it 'should belongs to movie' do
      movie1= FactoryGirl.create(:movie)
      movie2= FactoryGirl.create(:movie)
      screen = FactoryGirl.create(:screen ,movie_id: movie1.id)
      screen.movie_id.should_not eq movie2.id
    end
    it 'should have many showtimes' do
      screen1 = FactoryGirl.create(:screen)
      screen2 = FactoryGirl.create(:screen)
      showtime1 = FactoryGirl.create(:showtime, screen_id: screen1.id)
      showtime2 = FactoryGirl.create(:showtime, screen_id: screen2.id)
      showtime1.screen.id.should_not eq screen2.id 
      showtime2.screen.id.should_not eq screen1.id 
    end
  end  
end