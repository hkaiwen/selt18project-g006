##
# This class declares feedback model.

class Feedback < ActiveRecord::Base
  belongs_to :user
end
