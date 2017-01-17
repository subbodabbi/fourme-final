class ProjectsController < ApplicationController
	def list
		if Project.where(user_id: current_user[:id]).length != 0
			a = Project.where(user_id: current_user[:id])
			render :json => a
		else
			render :json => ["no"]
		end
	end

	def create
		a = Project.new(user_id: current_user[:id], title: params['title'], description: params['description'], languages_required: params['languages_required'])
		if a.save
			render :json => ["ok"]
		else
			render :json => ["no"]
		end
	end

	def destroy
		a = Project.find(params['id'])
		a.destroy
	end
end
