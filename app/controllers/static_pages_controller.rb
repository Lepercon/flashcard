class StaticPagesController < ApplicationController
  def show
    render params[:id]
  end


  def home
  end
  
  def help
  end
end
