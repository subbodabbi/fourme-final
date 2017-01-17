class DevelopersController < ApplicationController

  def index
  end

  def create
	a = Developer.new(developer_params)
 	a.users_id = current_user[:id]
	if a.save 
	  render :json => "2"
	else
 	  render :json => "1"
	end
  end

  def show
    a = Developer.find_by(users_id: current_user[:id])
    render :json => a
  end

  def update
    Developer.update(params['id'], params.first[0] => params.first[1])
    render :json => "#{params.first}"
  end
 
  def destroy
    a = Developer.find_by(users_id: current_user[:id])
	a.destroy
  end
 
  private
 
  def developer_params
    params.permit(:name, :description, :motto, :avatar, skills: [])
  end

end
