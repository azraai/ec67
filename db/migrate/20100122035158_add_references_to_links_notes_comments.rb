class AddReferencesToLinksNotesComments < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.references :item
    end
    
    change_table :notes do |t|
      t.references :item
    end
    
    change_table :comments do |t|
      t.references :item
    end
  end

  def self.down
    change_table :links do |t|
      t.remove :item_id
    end
    
    change_table :notes do |t|
      t.remove :item_id
    end
    
    change_table :comments do |t|
      t.remove :item_id
    end
  end
end
