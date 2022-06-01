require 'date'

class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @summary = {
      contact: Contact.summary,
      locality: Locality.summary,
      users: User.summary,
      regions: Region.summary
    }
  end
end
