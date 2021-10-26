class ApplicationController < ActionController::Base
  helper_method :is_current_professional_profile?

  def is_current_professional_profile?
     professional_signed_in? && current_professional.profile.present?
  end
end
