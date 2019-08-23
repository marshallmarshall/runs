Rails.application.routes.draw do
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

  #------------------------------

  # Routes for the Run resource:

  # CREATE
  get("/runs/new", { :controller => "runs", :action => "new_form" })
  post("/create_run", { :controller => "runs", :action => "create_row" })

  # READ
  get("/runs", { :controller => "runs", :action => "index" })
  get("/runs/:id_to_display", { :controller => "runs", :action => "show" })

  # UPDATE
  get("/runs/:prefill_with_id/edit", { :controller => "runs", :action => "edit_form" })
  post("/update_run/:id_to_modify", { :controller => "runs", :action => "update_row" })

  # DELETE
  get("/delete_run/:id_to_remove", { :controller => "runs", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
