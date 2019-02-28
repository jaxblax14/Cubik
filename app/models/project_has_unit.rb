class ProjectHasUnit < ApplicationRecord
  belongs_to :projects
  belongs_to :units
end
