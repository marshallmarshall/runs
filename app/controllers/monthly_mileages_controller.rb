class MonthlyMileagesController < ApplicationController
  before_action :current_user_must_be_monthly_mileage_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_monthly_mileage_user
    monthly_mileage = MonthlyMileage.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == monthly_mileage.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @monthly_mileages = current_user.monthly_mileages.page(params[:page]).per(10)

    render("monthly_mileage_templates/index.html.erb")
  end

  def show
    @monthly_mileage = MonthlyMileage.find(params.fetch("id_to_display"))

    render("monthly_mileage_templates/show.html.erb")
  end

  def new_form
    @monthly_mileage = MonthlyMileage.new

    render("monthly_mileage_templates/new_form.html.erb")
  end

  def create_row
    @monthly_mileage = MonthlyMileage.new

    @monthly_mileage.month_starting = params.fetch("month_starting")
    @monthly_mileage.monthly_mileage = params.fetch("monthly_mileage")
    @monthly_mileage.user_id = params.fetch("user_id")

    if @monthly_mileage.valid?
      @monthly_mileage.save

      redirect_back(:fallback_location => "/monthly_mileages", :notice => "Monthly mileage created successfully.")
    else
      render("monthly_mileage_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @monthly_mileage = MonthlyMileage.find(params.fetch("prefill_with_id"))

    render("monthly_mileage_templates/edit_form.html.erb")
  end

  def update_row
    @monthly_mileage = MonthlyMileage.find(params.fetch("id_to_modify"))

    @monthly_mileage.month_starting = params.fetch("month_starting")
    @monthly_mileage.monthly_mileage = params.fetch("monthly_mileage")
    

    if @monthly_mileage.valid?
      @monthly_mileage.save

      redirect_to("/monthly_mileages/#{@monthly_mileage.id}", :notice => "Monthly mileage updated successfully.")
    else
      render("monthly_mileage_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @monthly_mileage = MonthlyMileage.find(params.fetch("id_to_remove"))

    @monthly_mileage.destroy

    redirect_to("/users/#{@monthly_mileage.user_id}", notice: "MonthlyMileage deleted successfully.")
  end

  def destroy_row
    @monthly_mileage = MonthlyMileage.find(params.fetch("id_to_remove"))

    @monthly_mileage.destroy

    redirect_to("/monthly_mileages", :notice => "Monthly mileage deleted successfully.")
  end
end
