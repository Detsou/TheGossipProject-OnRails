class WelcomeController < ApplicationController
  def show
    puts "Notre paramètre id : " + "#{params[:id]}"
  end

  def home
  end
end
