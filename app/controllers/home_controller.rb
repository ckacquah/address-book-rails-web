class HomeController < ApplicationController
  def index
    flash.now[:error] = 'This error message really worked!'
    flash.now[:warning] = 'This warning message really worked!'
    flash.now[:success] = 'This success message really worked!'
    flash.now[:info] = 'This info message really worked!'
  end
end
