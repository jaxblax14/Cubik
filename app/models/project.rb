class Project < ApplicationRecord
  belongs_to :unit, optional: true
  belongs_to :project_state
  belongs_to :challenge
end
