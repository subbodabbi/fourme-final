class DevelopersController < ApplicationController

  def index
    @developer = Developer.where.not(users_id: current_user[:id])
  end

  def create
    

    if params[:developer][:skills].length > 0
      b = params[:developer][:skills].split(', ')
    else
      b = []
    end
    {'ruby' => params[:developer][:ruby], 'Python' => params[:developer][:Python], 'JavaScript' => params[:developer][:JavaScript],'JScript' => params[:developer][:JScript], 'C' => params[:developer][:C], "C++" => params[:developer][:"C++"],"C#" =>  params[:developer][:"C#"], "Objective-C" => params[:developer][:"Objective-C"], "Digital Marketing" => params[:developer][:"Digital Marketing"], "PHP" => params[:developer][:PHP], "SQL" => params[:developer][:SQL], "Bash" => params[:developer][:Bash], "Swift" => params[:developer][:Swift]}.each_pair do |key,value|
      
      if value == "1" 
        b << key
      else
      end
    end
	 a = Developer.new(name: params[:developer][:name], description: params[:developer][:description], motto: params[:developer][:motto], avatar: params[:developer][:avatar], skills: b, users_id: params[:developer][:users_id])

   
	 if a.save 
    
	  redirect_to root_path
	 else
    
 	  redirect_to root_path
	 end
  end

  def show
    a = Developer.find_by(users_id: current_user[:id])
    render :json => a
  end

  def show2
   a = Developer.find(params[:id])
   a.avatar = params[:developer][:avatar]
   a.save
    redirect_to root_path, flash: {notice: "bla"}
  end

  def update
    if params.first[0] == 'skills'
      a = Developer.find(params['id'])
      a.skills << params.first[1]
      a.save
      render :json => ["ok"]
    elsif params.first[0] == 'killskill'
      a = Developer.find(params['id'])
      a.skills.delete("#{params.first[1]}")
      if a.save
        render :json => ["ok"]
      else
        render :json => ["no"]
      end
    else
      Developer.update(params['id'], params.first[0] => params.first[1])
      render :json => ["ok"]
    end
  end
 
  def destroy
    a = Developer.find_by(users_id: current_user[:id])
    a.destroy
    redirect_to root_path
  end
 
  private
 
  def developer_params
    params.permit(:name, :description, :motto, :avatar, :skills, :ruby, :Python, :JavaScript, :JScript, :C, :"C++", :"C#", :"Objective-C", :"Digital Marketing", :PHP, :SQL, :Bash, :Swift, :users_id)
  end

end
