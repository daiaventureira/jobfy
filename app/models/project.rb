class Project < ApplicationRecord
    belongs_to :user
    has_many :project_applications, dependent: :destroy

    validates :title, :description, :skills, :deadline, :price_per_hour, presence: true
    validate :deadline_application_lesser_than_current_day

    enum status: {active: 20, closed: 25}


    def closed?
        super || deadline < DateTime.current
    end

    def is_owner?(user_id)
        user.id == user_id
    end

    private

    def deadline_application_lesser_than_current_day
        if !deadline || deadline < DateTime.current
            errors.add(:deadline, 'deve ser maior que a data atual')
        end
    end
end
