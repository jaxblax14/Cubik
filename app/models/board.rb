class Board < ApplicationRecord
  belongs_to :board_model
  belongs_to :project , optional: true
end
