class ApplicationController < ActionController::Base

  def authenticate_any!
    if user_signed_in?
      true
    else
      authenticate_company!
    end
  end

end
