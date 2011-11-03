class Users::RegistrationsController < Devise::RegistrationsController
  #prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  skip_before_filter :require_no_authentication
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  include Devise::Controllers::InternalHelpers
	
  #before_filter :check_permissions, :only => [:new, :create, :cancel]
  
 
  # GET /resource/sign_up
  def new
    build_resource
    render_with_scope :new
  end

  # POST /resource
  def create
    build_resource
    
    resource.role_ids = params[:user][:role_ids] if params[:user]
    
    if resource.save
      set_flash_message :notice, :signed_up
      redirect_to users_path
     # sign_in_and_redirect(resource_name, resource)
    else
      render_with_scope :new
    end
  end

  # GET /resource/edit
  def edit
    render_with_scope :edit
  end

  # PUT /resource
  def update
    if self.resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
      redirect_to after_sign_in_path_for(self.resource)
    else
      render_with_scope :edit
    end
  end

  # DELETE /resource
  def destroy
    self.resource.destroy
    set_flash_message :notice, :destroyed
    sign_out_and_redirect(self.resource)
  end

  def check_permissions
    authorize! :create, resource
  end
end
