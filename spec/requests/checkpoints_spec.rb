require 'spec_helper'

describe "Checkpoints" do
  
  before do
    User.destroy_all
    login_admin
  end
  
  describe "GET /checkpoints" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get checkpoints_path
      response.status.should be(200)
    end
  end
end
