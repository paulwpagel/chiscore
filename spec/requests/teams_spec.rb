require 'spec_helper'

describe "Teams" do

  
  describe "GET /teams" do
    before do
      User.destroy_all
    end
    
    it "works! (now write some real specs)" do
      login_admin
      get teams_path
      response.status.should be(200)
    end
  end
end
