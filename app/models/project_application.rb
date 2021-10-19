class ProjectApplication < ApplicationRecord
  belongs_to :project
  belongs_to :professional

  enum status: {pending: 5, accepted: 10, rejected: 15}

end
