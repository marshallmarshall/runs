class RunsController < ApplicationController
  def index
    @runs = Run.all

    render("run_templates/index.html.erb")
  end

  def show
    @run = Run.find(params.fetch("id_to_display"))

    render("run_templates/show.html.erb")
  end

  def new_form
    @run = Run.new

    render("run_templates/new_form.html.erb")
  end

  def create_row
    @run = Run.new

    @run.date_of_run = params.fetch("date_of_run")
    @run.training_week = params.fetch("training_week")
    @run.miles_planned = params.fetch("miles_planned")
    @run.miles_actual = params.fetch("miles_actual")
    @run.treadmill_incline = params.fetch("treadmill_incline")
    @run.run_duration_minutes = params.fetch("run_duration_minutes")
    @run.run_duration_seconds = params.fetch("run_duration_seconds")
    @run.actual_pace = params.fetch("actual_pace")
    @run.location_id = params.fetch("location_id")
    @run.notes = params.fetch("notes")
    @run.user_id = params.fetch("user_id")
    @run.shoe_id = params.fetch("shoe_id")

    if @run.valid?
      @run.save

      redirect_back(:fallback_location => "/runs", :notice => "Run created successfully.")
    else
      render("run_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_shoe
    @run = Run.new

    @run.date_of_run = params.fetch("date_of_run")
    @run.training_week = params.fetch("training_week")
    @run.miles_planned = params.fetch("miles_planned")
    @run.miles_actual = params.fetch("miles_actual")
    @run.treadmill_incline = params.fetch("treadmill_incline")
    @run.run_duration_minutes = params.fetch("run_duration_minutes")
    @run.run_duration_seconds = params.fetch("run_duration_seconds")
    @run.actual_pace = params.fetch("actual_pace")
    @run.location_id = params.fetch("location_id")
    @run.notes = params.fetch("notes")
    @run.user_id = params.fetch("user_id")
    @run.shoe_id = params.fetch("shoe_id")

    if @run.valid?
      @run.save

      redirect_to("/shoes/#{@run.shoe_id}", notice: "Run created successfully.")
    else
      render("run_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @run = Run.find(params.fetch("prefill_with_id"))

    render("run_templates/edit_form.html.erb")
  end

  def update_row
    @run = Run.find(params.fetch("id_to_modify"))

    @run.date_of_run = params.fetch("date_of_run")
    @run.training_week = params.fetch("training_week")
    @run.miles_planned = params.fetch("miles_planned")
    @run.miles_actual = params.fetch("miles_actual")
    @run.treadmill_incline = params.fetch("treadmill_incline")
    @run.run_duration_minutes = params.fetch("run_duration_minutes")
    @run.run_duration_seconds = params.fetch("run_duration_seconds")
    @run.actual_pace = params.fetch("actual_pace")
    @run.location_id = params.fetch("location_id")
    @run.notes = params.fetch("notes")
    
    @run.shoe_id = params.fetch("shoe_id")

    if @run.valid?
      @run.save

      redirect_to("/runs/#{@run.id}", :notice => "Run updated successfully.")
    else
      render("run_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @run = Run.find(params.fetch("id_to_remove"))

    @run.destroy

    redirect_to("/users/#{@run.user_id}", notice: "Run deleted successfully.")
  end

  def destroy_row_from_shoe
    @run = Run.find(params.fetch("id_to_remove"))

    @run.destroy

    redirect_to("/shoes/#{@run.shoe_id}", notice: "Run deleted successfully.")
  end

  def destroy_row
    @run = Run.find(params.fetch("id_to_remove"))

    @run.destroy

    redirect_to("/runs", :notice => "Run deleted successfully.")
  end
end
