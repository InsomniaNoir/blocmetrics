class RegisteredApplicationsController < ApplicationController
  def index
    @application = RegisteredApplication.all
  end

  def new
    @application = find_params_id
  end

  def edit
    @application = find_params_id
  end

  def show
    @application = find_params_id
  end

  def create
    @application = RegisteredApplication.new( application_params )

    if @application.save
      flash[:notice] = "Your application has been registered."
      redirect_to @application
    else
      flash[:error] = "Your application failed to register. Please try again."
      redirect_to :new
  end

  def update
    @application = find_params_id

    if @application.update_attributes( wiki_params )
      flash[:notice] = "Your application info has been updated."
    else
      flash[:error] = "Your application was not updated, please try again."
    end
    redirect_to @application
  end

  def destroy
    @application = find_params_id

    if @application.destroy
      flash[:notice] = "Your application has been removed."
      redirect_to registered_applications_path
    else
      flash[:error] = "Your application was not removed. Please try again."
      redirect_to :show
    end
  end

  private

  def application_params
    params.require(:registered_application).permit(:name, :url)
  end

  def find_params_id
    RegisteredApplication.find(params[:id])
  end
end
