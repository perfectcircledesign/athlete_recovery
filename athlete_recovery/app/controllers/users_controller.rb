class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if params[:user][:blood_gas_test] == '1' and params[:accept].present?
        if @user.save
          format.html { redirect_to :back, notice: 'The form has been submitted successfully' }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: "new" }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
      format.html { redirect_to :back, notice: 'You need to tick all the checkboxes to submit the form' }
    end
  end

  def edit
    if admin_signed_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

 def update
    respond_to do |format|
      @user = User.find(params[:id])
      if @user.update_attributes(name: params[:user][:name],surname: params[:user][:surname], id_number: params[:user][:id_number], email: params[:user][:email], phone: params[:user][:phone], resting_heart_rate: params[:user][:resting_heart_rate], blood_gas_test: params[:user][:blood_gas_test] )

        #link_user_events
        format.html { redirect_to admin_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end