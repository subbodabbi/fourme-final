class ProjectsController < ApplicationController
	def list
		if Project.where(user_id: current_user[:id]).length != 0
			a = Project.where(user_id: current_user[:id])
			render :json => a
		else
			render :json => ["no"]
		end
	end

	def list2
		arr = []
		a = Project.where('user_id != ?', current_user[:id]) 
		if a.length > 0
			a.each do |x|
				x.developers_id.each do |y|
					if y[0] == current_user[:id]
						arr << x
					end
				end
			end
			render :json => arr
		else
			render :json => ["no"]
		end
	end

	def index
    	@project = Project.where.not(user_id: current_user[:id])
  	end

  	def add_dev
  		b = 0
  		a = Project.find(params['project_id'])
  		a.developers_id.each do |x|
  			if x[0] == current_user[:id]
  				x[1] = 1
  				b = 1
  			else 
  			end
  		end
  		if b == 0
  			a.developers_id << [current_user[:id], 1]
  		end
  		if a.save
  			render :json => [a.id]
  		else
  			render :json => [a.id]
  		end
  	end

  	def add_dev_leave

  		a = Project.find(params['project_id'])
  		
  		arr = a.developers_id
  		arr.map! do |x|
  			if x[0].to_i == current_user[:id].to_i
  				x = nil
  			end
  		end
  		arr.compact!
  		a.developers_id = arr
  		if a.save
  			render :json => [a.id]
  		else
  			render :json => [a.id]
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

	def upvote
		@project = Project.find(params[:id])
		@project.upvote_by current_user
		respond_to do |format|
		  format.html {redirect_to projects_path}
		  format.js { render layout: false}
		end
	end
	
	def downvote
		@project = Project.find(params[:id])
		@project.downvote_by current_user
		respond_to do |format|
		  format.html {redirect_to projects_path}
		  format.js { render layout: false}
		end
	end	

end
