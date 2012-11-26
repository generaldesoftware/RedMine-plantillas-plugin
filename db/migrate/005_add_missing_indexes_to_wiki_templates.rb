class AddMissingIndexesToWikiTemplates < ActiveRecord::Migration
  def self.up
    add_column :wiki_templates, :visible_children, :boolean, :default => true
  end

  def self.down
    remove_column :wiki_templates, :visible_children
  end
end
