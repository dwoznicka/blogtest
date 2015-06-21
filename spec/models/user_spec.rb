require "rails_helper"

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:encrypted_password) }
  it { should validate_presence_of(:email) }
  it { should validate_numericality_of(:age) }
  it { should validate_uniqueness_of(:login) }

  it do
    should allow_value(10).for(:age)
    should_not allow_value(200).for(:age)
  end
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { should have_many(:favourites) }
  it { should have_one(:profile) }
  it { should have_and_belong_to_many(:roles) }
  it "should return only old users" do
    @user1 = User.create!(:login => 'nowy', :encrypted_password => "password1", :password => "password", :email => 'daria@daria.com', :age => 50)
    @user2 = User.create!(:login => 'nowy2', :encrypted_password => "password2", :password => "password", :email => 'daria2@daria.com', :age => 100)

    expect(User.old).to_not include(@user1)
    expect(User.old).to include(@user2)
  end
end