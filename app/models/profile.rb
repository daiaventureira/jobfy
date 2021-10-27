class Profile < ApplicationRecord
  belongs_to :professional
  validates :full_name, :birth_date, :description, :educational_background, :experience, presence: true
  validate :professional_should_be_at_least_eighteen_years

  private

  def professional_should_be_at_least_eighteen_years
    if birth_date? && birth_date > 18.years.ago
      return errors.add :birth_date, 'deve corresponder a um profissional de 18 anos ou mais.'
    elsif !birth_date
       errors.add(:birth_date, 'deve ser preenchido')
    end 
  end
end 
