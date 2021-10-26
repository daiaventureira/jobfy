class Profile < ApplicationRecord
  belongs_to :professional
  validates :full_name, :birth_date, :description, :educational_background, :experience, presence:{ message: "Todos os campos são obrigatórios menos nome social!" }
  validate :professional_should_be_at_least_eighteen_years

  private

  def professional_should_be_at_least_eighteen_years
    if birth_date? && birth_date > 18.years.ago
      return errors.add :birth_date, 'Profissional deve ter no mínimo 18 anos'
    elsif !birth_date
       errors.add(:birth_date, 'Campo data de nascimento deve ser preenchido')
    end 
  end
end 
