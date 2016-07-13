module AuthenticationControllerHelper

  def authorized?(object)
    logged_in? && object.user.id == current_user.id
  end

  def restricted_access(object)
    redirect_to no_access_path unless authorized?(object)
  end

  def logged_in_access
    redirect_to no_access_path unless logged_in?
  end
end
