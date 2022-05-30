class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :phone
      t.text :description
      t.boolean :del_status, default: false
      t.boolean :active_status, default: true
      t.string :locality_code
      t.uuid :assigned_code, default: 'gen_random_uuid()'
      t.timestamps
    end
  end
end
