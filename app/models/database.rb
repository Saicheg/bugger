class Database < ActiveRecord::Base
  has_one :husband
  has_one :wife
  has_many :children

  accepts_nested_attributes_for :husband
  accepts_nested_attributes_for :wife
  accepts_nested_attributes_for :children, allow_destroy: true
end
