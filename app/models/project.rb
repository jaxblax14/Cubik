class Project < ApplicationRecord
  belongs_to :unit, optional: true
  belongs_to :project_state
  belongs_to :challenge
  belongs_to :user, class_name: 'User', foreign_key: 'users_id'
end