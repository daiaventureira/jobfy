class Project < ApplicationRecord
    belongs_to :user
    has_many :project_applications, dependent: :destroy

    validates :title, :description, :skills, :deadline, :price_per_hour, presence: true
    validate :deadline_lesser_than_current_day

    enum status: {active: 20, closed: 25}

    private

    def deadline_lesser_than_current_day
        if !deadline || deadline < DateTime.current
            errors.add(:deadline, 'deve ser maior que a data atual')
        end
    end 
end
