class Project < ApplicationRecord
  belongs_to :unit
  belongs_to :project_state
  belongs_to :challenge
end
