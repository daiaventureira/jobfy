class Profile < ApplicationRecord
  has_one_attached :avatar
  belongs_to :professional
  validates :full_name, :birth_date, :avatar, :description, :educational_background, presence:{ message: "Todos os campos são obrigatórios menos nome social!" }
  validate :professional_should_be_at_least_eighteen_years
  validate :profile_completeness
  private

  def professional_should_be_at_least_eighteen_years
    if birth_date? && birth_date > 18.years.ago
        errors.add(:birth_date, 'Profissional deve ter no mínimo 18 anos')
    elsif !birth_date
      errors.add(:birth_date, 'Campo data de nascimento deve ser preenchido')
    end 
  end

  def profile_completeness
    if !:full_name.present?  && !:birth_date.present? && !:avatar.present? && !:description.present? && !:educational_background.present?
      erros.add("Complete seu perfil")
    end
  end
end 

