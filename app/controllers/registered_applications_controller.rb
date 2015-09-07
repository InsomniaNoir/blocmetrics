class RegisteredApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @registered_applications = current_user.registered_applications.all
  end

  def new
    @registered_applications = RegisteredApplication.new
  end

  def edit
    @registered_applications = @user.applications.find(params[:id])
  end

  def show
    @user = current_user
    @registered_applications = @user.applications.find(params[:user_id])
  end

  def create
    @user = current_user
    @registered_applications = current_user.applications.build( application_params )
    @registered_applications.user = @user

    if @registered_applications.save
      flash[:notice] = "Your application has been registered."
      redirect_to registered_applications_path(current_user)
    else
      flash[:error] = "Your application failed to register. Please try again."
      redirect_to :new
  end

  def destroy
    @registered_applications = RegisteredApplication.find(params[:id])

    if @registered_applications.destroy
      flash[:notice] = "Your application has been removed."
      redirect_to registered_applications_path(current_user)
    else
      flash[:error] = "Your application was not removed. Please try again."
      redirect_to :show
    end
  end

  private

  def application_params
    params.require(:application).permit(:name, :url)
  end
end
end
