require 'rails_helper'

RSpec.describe 'User' do           
  it 'User Should NOT create user successfully.' do   
    test = FactoryBot.create(:user)

    expect(test.name).to(be("Joe"))
  end
end
