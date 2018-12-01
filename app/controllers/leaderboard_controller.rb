#frozen_string_literal = true

class LeaderboardController < ApplicationController

  def index
    @top_score = Leaderboard.get_users

  end
end
