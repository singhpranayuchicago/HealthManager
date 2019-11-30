Rails.application.routes.draw do



  # Routes for the Doctor resource:

  # CREATE
  match("/insert_doctor", { :controller => "doctors", :action => "create", :via => "post"})
  
  # READ
  match("/doctors", { :controller => "doctors", :action => "index", :via => "get"})
  
  match("/doctors/:id_from_path", { :controller => "doctors", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_doctor/:id_from_path", { :controller => "doctors", :action => "update", :via => "post"})

  # DELETE
  match("/delete_doctor/:id_from_path", { :controller => "doctors", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Appointment resource:

  # CREATE
  match("/insert_appointment", { :controller => "appointments", :action => "create", :via => "post"})
          
  # READ
  match("/appointments", { :controller => "appointments", :action => "index", :via => "get"})
  
  match("/appointments/:id_from_path", { :controller => "appointments", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_appointment/:id_from_path", { :controller => "appointments", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_appointment/:id_from_path", { :controller => "appointments", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for the Drug resource:

  # CREATE
  match("/insert_drug", { :controller => "drugs", :action => "create", :via => "post"})
          
  # READ
  match("/drugs", { :controller => "drugs", :action => "index", :via => "get"})
  
  
  match("/drugs/:id_from_path", { :controller => "drugs", :action => "show", :via => "get"})
  
  # UPDATE

  match("/modify_drug/:id_from_path", { :controller => "drugs", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_drug/:id_from_path", { :controller => "drugs", :action => "destroy", :via => "get"})

  #------------------------------

  # Routes for signing up

  match("/user_sign_up", { :controller => "users", :action => "new_registration_form", :via => "get"})
  
  match("/user/:the_email", { :controller => "users", :action => "show", :via => "get"})

  match("/", { :controller => "drugs", :action => "index", :via => "get"})

  # Routes for signing in
  match("/user_sign_in", { :controller => "user_sessions", :action => "new_session_form", :via => "get"})
  
  match("/user_verify_credentials", { :controller => "user_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/user_sign_out", { :controller => "user_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_user", { :controller => "users", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_user", { :controller => "users", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_user", { :controller => "users", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_user_account", { :controller => "users", :action => "destroy", :via => "get"})


  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
