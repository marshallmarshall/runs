Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "runs#index"
  # Routes for the Monthly mileage resource:

  # CREATE
  get("/monthly_mileages/new", { :controller => "monthly_mileages", :action => "new_form" })
  post("/create_monthly_mileage", { :controller => "monthly_mileages", :action => "create_row" })

  # READ
  get("/monthly_mileages", { :controller => "monthly_mileages", :action => "index" })
  get("/monthly_mileages/:id_to_display", { :controller => "monthly_mileages", :action => "show" })

  # UPDATE
  get("/monthly_mileages/:prefill_with_id/edit", { :controller => "monthly_mileages", :action => "edit_form" })
  post("/update_monthly_mileage/:id_to_modify", { :controller => "monthly_mileages", :action => "update_row" })

  # DELETE
  get("/delete_monthly_mileage/:id_to_remove", { :controller => "monthly_mileages", :action => "destroy_row" })
  get("/delete_monthly_mileage_from_user/:id_to_remove", { :controller => "monthly_mileages", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Weekly mileage resource:

  # CREATE
  get("/weekly_mileages/new", { :controller => "weekly_mileages", :action => "new_form" })
  post("/create_weekly_mileage", { :controller => "weekly_mileages", :action => "create_row" })

  # READ
  get("/weekly_mileages", { :controller => "weekly_mileages", :action => "index" })
  get("/weekly_mileages/:id_to_display", { :controller => "weekly_mileages", :action => "show" })

  # UPDATE
  get("/weekly_mileages/:prefill_with_id/edit", { :controller => "weekly_mileages", :action => "edit_form" })
  post("/update_weekly_mileage/:id_to_modify", { :controller => "weekly_mileages", :action => "update_row" })

  # DELETE
  get("/delete_weekly_mileage/:id_to_remove", { :controller => "weekly_mileages", :action => "destroy_row" })
  get("/delete_weekly_mileage_from_user/:id_to_remove", { :controller => "weekly_mileages", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Shoe resource:

  # CREATE
  get("/shoes/new", { :controller => "shoes", :action => "new_form" })
  post("/create_shoe", { :controller => "shoes", :action => "create_row" })

  # READ
  get("/shoes", { :controller => "shoes", :action => "index" })
  get("/shoes/:id_to_display", { :controller => "shoes", :action => "show" })

  # UPDATE
  get("/shoes/:prefill_with_id/edit", { :controller => "shoes", :action => "edit_form" })
  post("/update_shoe/:id_to_modify", { :controller => "shoes", :action => "update_row" })

  # DELETE
  get("/delete_shoe/:id_to_remove", { :controller => "shoes", :action => "destroy_row" })
  get("/delete_shoe_from_user/:id_to_remove", { :controller => "shoes", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Location resource:

  # CREATE
  get("/locations/new", { :controller => "locations", :action => "new_form" })
  post("/create_location", { :controller => "locations", :action => "create_row" })

  # READ
  get("/locations", { :controller => "locations", :action => "index" })
  get("/locations/:id_to_display", { :controller => "locations", :action => "show" })

  # UPDATE
  get("/locations/:prefill_with_id/edit", { :controller => "locations", :action => "edit_form" })
  post("/update_location/:id_to_modify", { :controller => "locations", :action => "update_row" })

  # DELETE
  get("/delete_location/:id_to_remove", { :controller => "locations", :action => "destroy_row" })
  get("/delete_location_from_user/:id_to_remove", { :controller => "locations", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Run resource:

  # CREATE
  get("/runs/new", { :controller => "runs", :action => "new_form" })
  post("/create_run", { :controller => "runs", :action => "create_row" })
  post("/create_run_from_shoe", { :controller => "runs", :action => "create_row_from_shoe" })

  # READ
  get("/runs", { :controller => "runs", :action => "index" })
  get("/runs/:id_to_display", { :controller => "runs", :action => "show" })

  # UPDATE
  get("/runs/:prefill_with_id/edit", { :controller => "runs", :action => "edit_form" })
  post("/update_run/:id_to_modify", { :controller => "runs", :action => "update_row" })

  # DELETE
  get("/delete_run/:id_to_remove", { :controller => "runs", :action => "destroy_row" })
  get("/delete_run_from_shoe/:id_to_remove", { :controller => "runs", :action => "destroy_row_from_shoe" })
  get("/delete_run_from_user/:id_to_remove", { :controller => "runs", :action => "destroy_row_from_user" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
