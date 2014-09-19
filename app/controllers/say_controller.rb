class SayController < ApplicationController
  def welcome
	@time=Time.now.asctime
	@files = Dir.glob('*')
  end

  def goodbye
  end
end
