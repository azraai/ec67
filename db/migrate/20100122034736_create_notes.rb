class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :text
      
      t.timestamps
    end
  end

  def self.down
    remove_table :notes
  end
end
