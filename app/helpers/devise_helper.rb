module DeviseHelper
  def devise_error_messages!
    flash[:error] = resource.errors.full_messages.map{|o| o  }.join("/")
  end
end
