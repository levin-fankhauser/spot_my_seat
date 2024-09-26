class ActivityLogsController < ApplicationController
  def index
    @post_versions = PaperTrail::Version.where(item_type: "Post").order(created_at: :desc)
    @user_versions = PaperTrail::Version.where(item_type: "User").order(created_at: :desc)
    @seat_versions = PaperTrail::Version.where(item_type: "Seat").order(created_at: :desc)
  end
end
