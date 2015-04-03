class Admin::Base < ApplicationController
  layout 'admin'
  before_filter :restrict_access
  before_filter :restrict_admin_access

  protected
    def restrict_admin_access
      if current_user && !current_user.is_admin?
        flash[:notice] = "You're not admin!"
        redirect_to root_path
      end
    end

end