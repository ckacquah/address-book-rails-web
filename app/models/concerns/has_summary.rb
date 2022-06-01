require 'date'

module HasSummary

    extend ActiveSupport::Concern

  class_methods do

    def summary 
        @model_collection = active_and_not_deleted.order(:created_at)
        {
            count: @model_collection.count,
            start: {
                year: @model_collection.first.created_at.year,
                month: Date::MONTHNAMES[@model_collection.first.created_at.month]
            },
            current: {
                year: Time.now.year,
                month: Date::MONTHNAMES[Date.today.month]
            }
        }
    end

  end

end  