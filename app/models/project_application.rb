class ProjectApplication < ApplicationRecord

  belongs_to :project
  belongs_to :professional

  validates :introduction, presence: true
  
  enum status: {pending: 5, accepted: 10, rejected: 15}

  def professional_social_name_exists(p) 
    if p.professional.profile.social_name?
      true
    elsif !p.professional.profile.social_name?
      false
    end 
  end
  
  def professional_cannot_cancel_application(p)
     p.updated_at > 3.days.ago
  end
end
