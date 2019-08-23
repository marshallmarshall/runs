Rails.application.routes.draw do
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
