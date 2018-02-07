class AdminController < ApplicationController
before_filter :authenticate_admin!

	def index
		@users = User.order(:created_at)
	end

  def print_users
    @users = User.order(:name)

    respond_to do |format|
      format.html
      format.csv {send_data @users.to_csv}
      format.xls
    end
  end
end