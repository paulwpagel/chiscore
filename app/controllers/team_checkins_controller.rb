class TeamCheckinsController < ApplicationController
  
  def destroy
    @team_checkin = TeamCheckin.find(params[:id])
    @team_checkin.destroy

    respond_to do |format|
      format.html { redirect_to(root_url) }
      format.xml  { head :ok }
    end
  end
end
