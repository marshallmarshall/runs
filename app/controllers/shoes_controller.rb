class ShoesController < ApplicationController
  before_action :current_user_must_be_shoe_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_shoe_user
    shoe = Shoe.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == shoe.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.shoes.ransack(params[:q])
    @shoes = @q.result(:distinct => true).includes(:user, :runs).page(params[:page]).per(10)

    render("shoe_templates/index.html.erb")
  end

  def show
    @run = Run.new
    @shoe = Shoe.find(params.fetch("id_to_display"))

    render("shoe_templates/show.html.erb")
  end

  def new_form
    @shoe = Shoe.new

    render("shoe_templates/new_form.html.erb")
  end

  def create_row
    @shoe = Shoe.new

    @shoe.shoe_name = params.fetch("shoe_name")
    @shoe.user_id = params.fetch("user_id")

    if @shoe.valid?
      @shoe.save

      redirect_back(:fallback_location => "/shoes", :notice => "Shoe created successfully.")
    else
      render("shoe_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @shoe = Shoe.find(params.fetch("prefill_with_id"))

    render("shoe_templates/edit_form.html.erb")
  end

  def update_row
    @shoe = Shoe.find(params.fetch("id_to_modify"))

    @shoe.shoe_name = params.fetch("shoe_name")
    

    if @shoe.valid?
      @shoe.save

      redirect_to("/shoes/#{@shoe.id}", :notice => "Shoe updated successfully.")
    else
      render("shoe_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @shoe = Shoe.find(params.fetch("id_to_remove"))

    @shoe.destroy

    redirect_to("/users/#{@shoe.user_id}", notice: "Shoe deleted successfully.")
  end

  def destroy_row
    @shoe = Shoe.find(params.fetch("id_to_remove"))

    @shoe.destroy

    redirect_to("/shoes", :notice => "Shoe deleted successfully.")
  end
end
