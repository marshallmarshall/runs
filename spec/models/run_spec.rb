require 'rails_helper'

RSpec.describe Run, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:shoe) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
