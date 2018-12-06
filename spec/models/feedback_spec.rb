require 'rails_helper'
require 'spec_helper'

RSpec.describe Feedback, type: :model do
  it { should belong_to(:user) }
end

