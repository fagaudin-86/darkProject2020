class Parent < ApplicationRecord
  belongs_to :famille, optional: true
  has_many :enfants
end