class CreateAdminContents < ActiveRecord::Migration
  def change
    create_table :admin_contents do |t|
      t.string :about
      t.string :terms
      t.string :tick_box

      t.timestamps
    end
  end
end
