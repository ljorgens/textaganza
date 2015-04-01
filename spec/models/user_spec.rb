require 'rails_helper'

describe User do
  it { should have_many :messages }
  it { should have_many :contacts }

  it { should validate_presence_of :user_number }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password }


end
