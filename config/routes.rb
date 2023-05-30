Rails.application.routes.draw do
  get "/", :controller => "places", :action => "index"
  # get "/", :controller => "sessions", :action => "new"
  resources "places"
  resources "posts"
  resources "sessions"
  resources "users"
  get "/signup", :controller => "users", :action => "new"
  get "/login", :controller => "sessions", :action => "new"
  get "/logout", :controller => "sessions", :action => "destroy"
end
