class Category < ApplicationRecord
  has_many :equipment, dependent: :restrict_with_error
  end
