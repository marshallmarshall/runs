require 'rails_helper'

RSpec.describe Shoe, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:runs) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
