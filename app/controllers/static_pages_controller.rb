class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  def correct
  	matches = request.original_url.scan(/\d*$/).first.to_i
  	@answer = Answer.find(matches)
  end
end
