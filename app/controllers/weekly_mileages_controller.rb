class WeeklyMileagesController < ApplicationController
  before_action :current_user_must_be_weekly_mileage_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_weekly_mileage_user
    weekly_mileage = WeeklyMileage.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == weekly_mileage.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.weekly_mileages.ransack(params[:q])
    @weekly_mileages = @q.result(:distinct => true).includes(:user).page(params[:page]).per(10)

    render("weekly_mileage_templates/index.html.erb")
  end

  def show
    @weekly_mileage = WeeklyMileage.find(params.fetch("id_to_display"))

    render("weekly_mileage_templates/show.html.erb")
  end

  def new_form
    @weekly_mileage = WeeklyMileage.new

    render("weekly_mileage_templates/new_form.html.erb")
  end

  def create_row
    @weekly_mileage = WeeklyMileage.new

    @weekly_mileage.week_starting = params.fetch("week_starting")
    @weekly_mileage.weekly_mileage = params.fetch("weekly_mileage")
    @weekly_mileage.user_id = params.fetch("user_id")

    if @weekly_mileage.valid?
      @weekly_mileage.save

      redirect_back(:fallback_location => "/weekly_mileages", :notice => "Weekly mileage created successfully.")
    else
      render("weekly_mileage_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @weekly_mileage = WeeklyMileage.find(params.fetch("prefill_with_id"))

    render("weekly_mileage_templates/edit_form.html.erb")
  end

  def update_row
    @weekly_mileage = WeeklyMileage.find(params.fetch("id_to_modify"))

    @weekly_mileage.week_starting = params.fetch("week_starting")
    @weekly_mileage.weekly_mileage = params.fetch("weekly_mileage")
    

    if @weekly_mileage.valid?
      @weekly_mileage.save

      redirect_to("/weekly_mileages/#{@weekly_mileage.id}", :notice => "Weekly mileage updated successfully.")
    else
      render("weekly_mileage_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @weekly_mileage = WeeklyMileage.find(params.fetch("id_to_remove"))

    @weekly_mileage.destroy

    redirect_to("/users/#{@weekly_mileage.user_id}", notice: "WeeklyMileage deleted successfully.")
  end

  def destroy_row
    @weekly_mileage = WeeklyMileage.find(params.fetch("id_to_remove"))

    @weekly_mileage.destroy

    redirect_to("/weekly_mileages", :notice => "Weekly mileage deleted successfully.")
  end
end
