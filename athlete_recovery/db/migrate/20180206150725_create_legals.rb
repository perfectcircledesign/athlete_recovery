class CreateLegals < ActiveRecord::Migration
  def change
    create_table :legals do |t|
		t.string :terms
      t.timestamps
    end
  end
end
