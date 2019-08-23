class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all

    render("shoe_templates/index.html.erb")
  end

  def show
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
    @shoe.user_id = params.fetch("user_id")

    if @shoe.valid?
      @shoe.save

      redirect_to("/shoes/#{@shoe.id}", :notice => "Shoe updated successfully.")
    else
      render("shoe_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @shoe = Shoe.find(params.fetch("id_to_remove"))

    @shoe.destroy

    redirect_to("/shoes", :notice => "Shoe deleted successfully.")
  end
end
