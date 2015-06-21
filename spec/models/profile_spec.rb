require "rails_helper"

RSpec.describe Profile, :type => :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
  it { should validate_length_of(:title).is_at_most(140) }
  it { should validate_numericality_of(:hits) }
  it "should allow only integer values" do
    should allow_value(10).for(:hits)
    should_not allow_value(2.5).for(:hits)
  end
  it "should return only popular profiles" do
    @unpopular = Profile.create!(:user_id => 1, :title => "newtitle", :hits => 2)
    @popular = Profile.create!(:user_id => 2, :title => "newtitle2", :hits => 100000)
    expect(Profile.popular).to include(@popular)
    expect(Profile.popular).to_not include(@unpopular)
  end

  # it "should add a hit" do
  #   @profile = Profile.create!(:user_id => 2, :title => "newtitle2", :hits => 0)
  #   expect{@profile.add_hit}.to change{@profile.hits}.from(0).to(1)
  # end
end