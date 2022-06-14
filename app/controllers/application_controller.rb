class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning
  include Pagy::Backend

  puts "I love coding in the terminal"
end
