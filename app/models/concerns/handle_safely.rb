module HandleSafely

  extend ActiveSupport::Concern

  included do

    self.primary_key = 'assigned_code'

    scope :active, -> { where(active_status: true) }

    scope :not_deleted, -> { where(del_status: false) }

    scope :active_and_not_deleted, -> { active.not_deleted }

  end

  class_methods do
    def find_safely(id)
      active_and_not_deleted.where(assigned_code: id).order(:updated_at).first
    end
  end

  def safe_delete
    update(del_status: true)
  end

  # The function updates the model by making the previous record inactive
  # and adding the new update into the database
  def safe_update(update_params)
    new_params = {} # new parameters for the new update
    attribute_names.each do |attribute_name|
      # Get all the model attributes
      symbolic_name = attribute_name.to_sym # Convert the attribute name into a symbol
      new_params[symbolic_name] =
        update_params.key?(symbolic_name) ? update_params[symbolic_name] : attributes[attribute_name]
    end
    new_params.except!(:updated_at, :id) # Creating a new object with the old primary id doesn't
    # sound like a good idea. I also want to only preserve the created at param.
    new_record = self.class.new(new_params) # Instantiate the new record without writing to the database
    if new_record.valid? # Check if the record is valid before making any changes
      update(active_status: false) # make the old record inactive
    end
    return new_record, new_record.save
  end

end
