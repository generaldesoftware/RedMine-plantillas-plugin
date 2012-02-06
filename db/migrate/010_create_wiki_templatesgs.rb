class CreateWikiTemplatesgs < ActiveRecord::Migration
  def self.up
    create_table :wiki_templatesgs do |t|
      t.column :author_id, :integer
      t.column :text, :text
      t.column :name, :text
      t.column :updated_on, :datetime
    end
  end

  def self.down
    drop_table :wiki_templatesgs
  end
end
