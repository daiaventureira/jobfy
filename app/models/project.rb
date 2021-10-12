class Project < ApplicationRecord
    validate :deadline_lesser_than_current_day
    
    private

    def deadline_lesser_than_current_day
        if deadline < DateTime.current
            errors.add(:deadline, 'deve ser maior que a data atual')
        end
    end 


end
