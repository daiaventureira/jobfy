class Profile < ApplicationRecord
  has_one_attached :avatar
  belongs_to :professional

  validate :professional_should_be_at_least_eighteen_years

  private

  def professional_should_be_at_least_eighteen_years
    if birth_date > 18.years.ago
        errors.add(:birth_date, 'Profissional deve ter no mínimo 18 anos')
    end
  end
end 

