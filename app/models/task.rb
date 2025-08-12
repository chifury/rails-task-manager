class Task < ApplicationRecord
  # associations
  # validations
  # validates :column_name, whatever_validation
  validates :title, presence: true
  validates :details, presence: true
end
