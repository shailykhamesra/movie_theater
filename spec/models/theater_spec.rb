require 'rails_helper'
RSpec.describe Theater, type: :model do
  context 'validation test' do
    it 'is invalid without a name' do 
  	  FactoryGirl.build(:theater, name: nil).should_not be_valid	
    end
    it 'is valid with a name' do 
  	  FactoryGirl.build(:theater).should be_valid
    end
    it 'is invalid without a address' do 
  	  FactoryGirl.build(:theater, address: nil).should_not be_valid	
    end
    it 'is of valid length' do 
    	FactoryGirl.build(:theater).should be_valid	
    end
    it 'is of invalid length' do 
  	  FactoryGirl.build(:theater, name: nil).should_not be_valid
    end
    it 'is of invalid length' do 
    	FactoryGirl.build(:theater, address: nil).should_not be_valid
    end
  end
  context 'association' do
    it 'should have many screens' do
      theater = FactoryGirl.create(:theater)
      screen1 = FactoryGirl.create(:screen, theater_id: theater.id)
      screen2 = FactoryGirl.create(:screen, theater_id:theater.id)
      screen3 = FactoryGirl.create(:screen, theater_id:theater.id)
      screen1.theater.id.should eq theater.id and screen2.theater.id.should eq theater.id and screen3.theater.id.should eq theater.id
    end  
    it 'should have many screens' do
      theater1 = FactoryGirl.create(:theater)
      theater2 = FactoryGirl.create(:theater)
      screen1 = FactoryGirl.create(:screen, theater_id: theater1.id)
      screen2 = FactoryGirl.create(:screen, theater_id:theater2.id)
      screen1.theater.id.should_not eq theater2.id 
      screen2.theater.id.should_not eq theater1.id 
    end  
  end
end