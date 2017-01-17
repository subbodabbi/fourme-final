class ProjectsController < ApplicationController
	def list
		if Project.where(user_id: current_user[:id]).length != 0
			a = Project.where(user_id: current_user[:id])
			render :json => a
		else
			render :json => ["no"]
		end
	end

	def index
    	@project = Project.where.not(user_id: current_user[:id])
  	end

	def create
		a = Project.new(user_id: current_user[:id], title: params['title'], description: params['description'], languages_required: params['languages_required'])
		if a.save
			render :json => ["ok"]
		else
			render :json => ["no"]
		end
	end

	def show_proj
		a = Project.find(params['id'])
		render :json => a
	end

	def update
    	if params.first[0] == 'languages_required'
      		a = Project.find(params['id'])
      		a.languages_required << params.first[1]
      		a.save
      		render :json => ["ok"]
    	elsif params.first[0] == 'killskill'
      		a = Project.find(params['id'])
      		a.languages_required.delete("#{params.first[1]}")
      		if a.save
        		render :json => ["ok"]
      		else
        		render :json => ["no"]
      		end
    	else
      		Project.update(params['id'], params.first[0] => params.first[1])
      		render :json => ["ok"]
    	end
  	end

	def destroy
		a = Project.find(params['id'])
		a.destroy
	end
end
