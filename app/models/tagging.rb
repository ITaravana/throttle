class Tagging < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :tag
end
