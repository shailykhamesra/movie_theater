require 'rails_helper'
RSpec.describe Movie, type: :model do
  context 'validation test' do
    it 'is invalid without a name' do 
  	  FactoryGirl.build(:movie, name: nil).should_not be_valid	
    end
    it 'is valid with a name' do 
  	  FactoryGirl.build(:movie).should be_valid
    end
    it 'is of valid length' do 
  	  FactoryGirl.build(:movie).should be_valid	
    end
    it 'is of invalid length' do 
      FactoryGirl.build(:movie, name:nil).should_not be_valid 
    end
  end
  context 'association' do
    it 'should have many showtime' do
      movie = FactoryGirl.create(:movie)
      showtime1 = FactoryGirl.create(:showtime, movie_id: movie.id)
      showtime2 = FactoryGirl.create(:showtime, movie_id:movie.id)
      showtime3 = FactoryGirl.create(:showtime, movie_id:movie.id)
      showtime1.movie.id.should eq movie.id and showtime2.movie.id.should eq movie.id and showtime3.movie.id.should eq movie.id
    end
    it 'should have many screens' do
      movie = FactoryGirl.create(:movie)
      screen1 = FactoryGirl.create(:screen, movie_id: movie.id)
      screen2 = FactoryGirl.create(:screen, movie_id:movie.id)
      screen3 = FactoryGirl.create(:screen, movie_id:movie.id)
      screen1.movie.id.should eq movie.id and screen2.movie.id.should eq movie.id and screen3.movie.id.should eq movie.id
    end
    it 'should not have many showtime' do
      movie1 = FactoryGirl.create(:movie)
      movie2 = FactoryGirl.create(:movie)
      showtime1 = FactoryGirl.create(:showtime, movie_id: movie1.id)
      showtime2 = FactoryGirl.create(:showtime, movie_id:movie2.id)
      showtime1.movie.id.should_not eq movie2.id 
      showtime2.movie.id.should_not eq movie1.id 
   end
    it 'should not have many screens' do
      movie1 = FactoryGirl.create(:movie)
      movie2 = FactoryGirl.create(:movie)
      screen1 = FactoryGirl.create(:screen, movie_id: movie1.id)
      screen2 = FactoryGirl.create(:screen, movie_id:movie2.id)
      screen1.movie.id.should_not eq movie2.id 
      screen2.movie.id.should_not eq movie1.id 
   end
  end
end
 