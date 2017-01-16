class Clearance::SessionsController < Clearance::BaseController
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_to '/welcome#index'
      else
        redirect_to '/welcome#index'
      end
    end
  end
end
