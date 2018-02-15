class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
		t.string :about
      t.timestamps
    end
  end
end
