class LocationsController < ApplicationController
  def index
    @q = Location.ransack(params[:q])
    @locations = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("location_templates/index.html.erb")
  end

  def show
    @location = Location.find(params.fetch("id_to_display"))

    render("location_templates/show.html.erb")
  end

  def new_form
    @location = Location.new

    render("location_templates/new_form.html.erb")
  end

  def create_row
    @location = Location.new

    @location.location = params.fetch("location")
    @location.user_id = params.fetch("user_id")

    if @location.valid?
      @location.save

      redirect_back(:fallback_location => "/locations", :notice => "Location created successfully.")
    else
      render("location_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @location = Location.find(params.fetch("prefill_with_id"))

    render("location_templates/edit_form.html.erb")
  end

  def update_row
    @location = Location.find(params.fetch("id_to_modify"))

    @location.location = params.fetch("location")
    @location.user_id = params.fetch("user_id")

    if @location.valid?
      @location.save

      redirect_to("/locations/#{@location.id}", :notice => "Location updated successfully.")
    else
      render("location_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @location = Location.find(params.fetch("id_to_remove"))

    @location.destroy

    redirect_to("/users/#{@location.user_id}", notice: "Location deleted successfully.")
  end

  def destroy_row
    @location = Location.find(params.fetch("id_to_remove"))

    @location.destroy

    redirect_to("/locations", :notice => "Location deleted successfully.")
  end
end
