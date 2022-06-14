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

  def safe_update(update_params)
    # Extract old record values
    old_attributes = attributes.except(:id, :created_at, :updated_at)
    old_attributes["active_status"] = false
    # Generate new values
    new_attributes = update_params.to_h
    new_attributes["assigned_code"] = old_attributes["assigned_code"]
    # Update the record
    if update(new_attributes)
      # Insert the archive of the old invalid record
      old_record_copy = self.class.new(old_attributes)
      old_record_copy.save
    end
  end

end
