class AddMissingIndexesToWikiTemplates < ActiveRecord::Migration
  def self.up
    add_index :wiki_templates, :project_id
end

  def self.down
    remove_index :wiki_templates, :project_id
  end
end
