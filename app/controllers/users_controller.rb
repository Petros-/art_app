class UsersController < ApplicationController

	def index
    if params[:approved] == "false"
      @users = User.find_all_by_approved(false)
    else
      @users = User.all
    end
  end

  #this is for approving a user
  def approve_user
  user = User.find(params[:id])
  user.approved = true
	  if user.save
	    flash[:notice] = "#{user.full_name} approved"
	  else
	    flash[:alert] = "#{user.full_name} approval failure"
	  end
	  redirect_to :back
	end

end