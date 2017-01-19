class Clearance::SessionsController < Clearance::BaseController
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_to root_path
      else
        redirect_to root_path
      end
    end
  end
end
