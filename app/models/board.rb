class Board < ApplicationRecord
  belongs_to :project , optional: true
end
