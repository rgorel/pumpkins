class Pumpkin < ActiveRecord::Base
  belongs_to :farm
  accepts_nested_attributes_for :farm
end
