class SessionsController < ApplicationController
  def new

  end

  def create

    # Find the user based on the email the user entered
    @user = User.find_by({"email" => params["email"]})

    if @user != nil
      # Check to see if the password entered by the user is the same we have on file
      # If the passwords don't match, allow them to try again
      if @user["password"] != params["password"]
        flash["notice"] = "Wrong Password. Try Again."
        redirect_to "/sessions/new"
        # If the passwords match, send users to the places file
      else
        flash["notice"] = "Welcome!"
        redirect_to "/places"
      end 
    # If the user does not exist based on the email, tell them to create an account
    else
      flash["notice"] = "User does not exist. Please create an account."
      redirect_to "/sessions/new"
    end

  end

  def destroy
    #logout the user
    flash["notice"] = "Goodbye!"
    redirect_to "/sessions/new"
  end
end
  