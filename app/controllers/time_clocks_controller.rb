class TimeClocksController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(employee_id: params[:employee_id])
    if @user
      if @user.status.try(:upcase) == "CLOCKED IN"
        @user.clock_out
      else
        @user.clock_in
      end
      redirect_to :action => "status", :id => @user
    else
      redirect_to root_path
    end
  end

  def status
    @user = User.find(params[:id])
    @users = User.all
  end

  def report
    @user = User.find(params[:user_id])
  end

end
