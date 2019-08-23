class MonthlyMileagesController < ApplicationController
  def index
    @monthly_mileages = MonthlyMileage.all

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
    @monthly_mileage.user_id = params.fetch("user_id")

    if @monthly_mileage.valid?
      @monthly_mileage.save

      redirect_to("/monthly_mileages/#{@monthly_mileage.id}", :notice => "Monthly mileage updated successfully.")
    else
      render("monthly_mileage_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @monthly_mileage = MonthlyMileage.find(params.fetch("id_to_remove"))

    @monthly_mileage.destroy

    redirect_to("/monthly_mileages", :notice => "Monthly mileage deleted successfully.")
  end
end