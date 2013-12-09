class TimeClocksController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(employee_id: params[:employee_id])
    if @user
      @user.clock_in
      redirect_to :action => "status", :id => @user
    else
      redirect_to root_path
    end
  end

  def status
    @user = User.find(params[:id])
  end
end
