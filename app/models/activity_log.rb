class ActivityLog < ActiveRecord::Base
  validates :item_name, :updated_by, :activity, :presence => true

end
