class ActivityLogsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_versions = PaperTrail::Version.where(item_type: "Post").order(created_at: :desc)
    @user_versions = PaperTrail::Version.where(item_type: "User").order(created_at: :desc)
    @seat_versions = PaperTrail::Version.where(item_type: "Seat").order(created_at: :desc)
  end

  private

  def authenticate_admin!
    redirect_to root_path, alert: "Access denied." unless current_user&.admin?
  end
end
