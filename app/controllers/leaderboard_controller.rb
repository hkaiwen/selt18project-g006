#frozen_string_literal = true

class LeaderboardController < ApplicationController

  def index
    Leader.get_users

  end
end
