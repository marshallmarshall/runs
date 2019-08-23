require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:weekly_mileages) }

    it { should have_many(:locations) }

    it { should have_many(:runs) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
