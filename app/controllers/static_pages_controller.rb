class StaticPagesController < ApplicationController
  def home
  end
  def help
  
  end
  def correct
    if answer_correct?
      render template: 'static_pages/correct'
    else
      render template: 'static_pages/incorrect'
    end
  end
  def incorrect
  end
end
