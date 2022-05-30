class CreateLocalities < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :localities do |t|
      t.uuid :assigned_code, default: 'gen_random_uuid()'
      t.string :name
      t.text :description
      t.boolean :del_status, default: false
      t.boolean :active_status, default: true
      t.string :suburb_code

      t.timestamps
    end
  end
end
